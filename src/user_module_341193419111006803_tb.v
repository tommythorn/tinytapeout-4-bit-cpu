`timescale 1ns / 1ps
//`include "user_module_341193419111006803.v"

module user_module_341193419111006803_tb;

wire [7:0] io_in;
wire [7:0] io_out;

reg clk, reset, write_en;
reg [4:0] pdm_input;

assign io_in = {pdm_input, write_en, reset, clk};

user_module_341193419111006803 UUT (.io_in(io_in), .io_out(io_out));

initial begin
  $dumpfile("user_module_341193419111006803_tb.vcd");
  $dumpvars(0, user_module_341193419111006803_tb);
end

initial begin
   #100_000_000; // Wait a long time in simulation units (adjust as needed).
   $display("Caught by trap");
   $finish;
 end

parameter CLK_HALF_PERIOD = 5;
parameter TCLK = 2*CLK_HALF_PERIOD;
always begin
    clk = 1'b1;
    #(CLK_HALF_PERIOD);
    clk = 1'b0;
    #(CLK_HALF_PERIOD);
end

initial 
begin
    #20
    reset = 1;
    #(CLK_HALF_PERIOD);
    reset = 0;
end

initial begin
    write_en = 0;
    pdm_input = 5'h00;
    #(CLK_HALF_PERIOD);
    #(5*TCLK)
    write_en = 1;
    pdm_input= 5'h08;
    #(TCLK);
    write_en = 0;
    #(63*TCLK);
    write_en = 1;
    pdm_input= 5'h1a;
    #(TCLK);
    write_en = 0;
    #(63*TCLK);
    write_en = 1;
    pdm_input= 5'h0f;
    #(64*TCLK);
    pdm_input= 5'h04;
    #(64*TCLK);
    $finish;
end

endmodule
