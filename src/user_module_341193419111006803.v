`default_nettype none

// Instructions
`define Load 0
`define Store 1
`define Add 2
`define Bnz 3

// Commands
`define Reset 0
`define LoadCode 1
`define LoadData 2
`define Run 3

// Keep I/O fixed for TinyTapeout
module user_module_341193419111006803(
  input [7:0] io_in,
  output [7:0] io_out
);

   // State
   reg [1:0]   code[15:0];
   reg [3:0]   data[15:0];
   reg [3:0]   pc;
   reg [3:0]   acc;

   assign io_out = {pc, acc};
   wire [3:0]  cmdarg = io_in[7:4];
   wire [3:0]  arg = data[pc];

   always @(posedge io_in[0])
      case (io_in[2:1])
        `Reset: begin
           $display("        Reset");
           pc <= 0;
           acc <= 0;
        end
        `LoadCode: begin
           $display("        LoadCode %d: Insn %d", pc, cmdarg);
           code[pc] <= cmdarg;
           pc <= pc + 1;
        end
        `LoadData: begin
           $display("        LoadData %d: Data %d", pc, cmdarg);
           data[pc] <= cmdarg;
           pc <= pc + 1;
        end
        `Run: begin
           $display("        Running %d (insn %d, %d)", pc, code[pc], data[pc]);
           case (code[pc])
             `Load: begin acc = arg; pc = pc + 1; end
             `Store: begin data[arg] = acc; pc = pc + 1; end
             `Add: begin acc = acc + arg; pc = pc + 1; end
             `Bnz: begin pc = acc == 0 ? pc + 1 : arg; end
           endcase
           end
      endcase
endmodule

`ifdef TB
module tb;
   reg clock = 1;
   always #5 clock = !clock;

   //reg [7:0] io_in;
   reg [1:0] cmd;
   reg [3:0] cmdarg;

   wire [7:0] io_out;
   wire [7:0] io_in = {cmdarg, 1'b0, cmd, clock};
   user_module_341193419111006803 pdp0001(io_in, io_out);

   initial begin
      $monitor("%05d  pc %d acc %d", $time, pdp0001.pc, pdp0001.acc);
      cmd = `Reset;
      @(negedge clock)
      cmd = `LoadCode;

      cmdarg = `Load;
      @(negedge clock)
      cmdarg = `Store;
      @(negedge clock)

      cmdarg = `Add;
      @(negedge clock)
      cmdarg = `Store;
      @(negedge clock)

      cmdarg = `Load;
      @(negedge clock)
      cmdarg = `Store;
      @(negedge clock)

      cmdarg = `Load;
      @(negedge clock)
      cmdarg = `Add;
      @(negedge clock)
      cmdarg = `Store;
      @(negedge clock)
      cmdarg = `Bnz;
      @(negedge clock)

      cmdarg = `Load;
      @(negedge clock)
      cmdarg = `Bnz;
      @(negedge clock)
      cmdarg = `Bnz;
      @(negedge clock)
      cmdarg = `Bnz;
      @(negedge clock)
      cmdarg = `Bnz;
      @(negedge clock)
      cmdarg = `Bnz;
      @(negedge clock)

      cmd = `LoadData;

      cmdarg = 1;
      @(negedge clock)
      cmdarg = 4;
      @(negedge clock)
      cmdarg = 1;
      @(negedge clock)
      cmdarg = 0;
      @(negedge clock)
      cmdarg = 9;
      @(negedge clock)
      cmdarg = 2;
      @(negedge clock)
      cmdarg = 5;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock)
      cmdarg = 6;
      @(negedge clock)
      cmdarg = 0;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock)
      cmdarg = 15;
      @(negedge clock) cmd = `Reset;

      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;

      #100 $display("The End");
      $finish;
   end
endmodule
`endif
