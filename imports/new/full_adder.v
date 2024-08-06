`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input c_in,
    output o_sum,
    output o_carry
    );
   
   wire w_sum1;
   wire w_carry1;
   wire w_carry2;

   half_adder HA1(
    .a(a),
    .b(b),
    .o_sum(w_sum1),
    .o_carry(w_carry1)
   );
   
   half_adder HA2(
    .a(w_sum1),
    .b(c_in),
    .o_sum(o_sum),
    .o_carry(w_carry2)
   );

   assign o_carry = w_carry1 | w_carry2;

endmodule
