`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_341193419111006803(
  input [7:0] io_in,
  output [7:0] io_out
);

   always @(*)
     case (io_in[5:0])
       0: io_out = 2;
       1: io_out = 3;
       2: io_out = 5;
       3: io_out = 7;
       4: io_out = 11;
       5: io_out = 13;
       6: io_out = 17;
       7: io_out = 19;
       8: io_out = 23;
       9: io_out = 29;
       10: io_out = 31;
       11: io_out = 37;
       12: io_out = 41;
       13: io_out = 43;
       14: io_out = 47;
       15: io_out = 53;
       16: io_out = 59;
       17: io_out = 61;
       18: io_out = 67;
       19: io_out = 71;
       20: io_out = 73;
       21: io_out = 79;
       22: io_out = 83;
       23: io_out = 89;
       24: io_out = 97;
       25: io_out = 101;
       26: io_out = 103;
       27: io_out = 107;
       28: io_out = 109;
       29: io_out = 113;
       30: io_out = 127;
       31: io_out = 131;
       32: io_out = 137;
       33: io_out = 139;
       34: io_out = 149;
       35: io_out = 151;
       36: io_out = 157;
       37: io_out = 163;
       38: io_out = 167;
       39: io_out = 173;
       40: io_out = 179;
       41: io_out = 181;
       42: io_out = 191;
       43: io_out = 193;
       44: io_out = 197;
       45: io_out = 199;
       46: io_out = 211;
       47: io_out = 223;
       48: io_out = 227;
       49: io_out = 229;
       50: io_out = 233;
       51: io_out = 239;
       52: io_out = 241;
       53: io_out = 251;
       default: io_out = 0;
     endcase
endmodule
