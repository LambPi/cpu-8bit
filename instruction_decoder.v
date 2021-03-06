`timescale 1ns / 1ps


module instruction_decoder(
   instruction_i,
   alu_op_a_addr_o,
   alu_op_b_addr_o,
   alu_opcode_o,
   rd_en_o,
   wr_en_o,
   wr_addr_o,
   branch_en_o,
   branch_addr_o,
   immediate_o,
   immediate_en_o
    );

   input [12:0] instruction_i;
   output [2:0] alu_op_a_addr_o;
   output [2:0] alu_op_b_addr_o;
   output [2:0] alu_opcode_o;
   output rd_en_o;
   output wr_en_o;
   output [2:0] wr_addr_o;
   output branch_en_o;
   output [6:0] branch_addr_o;
   output [7:0] immediate_o;
   output immediate_en_o;


   assign alu_op_a_addr_o = instruction_i[8:6];
   assign alu_op_b_addr_o = instruction_i[5:3];
   assign alu_opcode_o = instruction_i[11:9];
   assign rd_en_o = ~instruction_i[12];
   assign wr_en_o = ~instruction_i[12] | (instruction_i[12:9] ==4'b1010) ? 1'b1 : 1'b0;
   assign wr_addr_o = instruction_i[2:0];
   assign branch_en_o = (instruction_i[12:10] == 3'b100) ? 1'b1 : 1'b0;
   assign branch_addr_o = instruction_i[6:0];
   assign immediate_o = {2'b00, instruction_i[8:3]};
   assign immediate_en_o = (instruction_i[12:9] == 4'b1010) ? 1'b1 : 1'b0;

endmodule
