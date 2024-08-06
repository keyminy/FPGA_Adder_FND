`timescale 1ns / 1ps

module half_adder(
    input a,
    input b,
    output o_sum,
    output o_carry
    );
   /* continous assignment */
    // assign o_sum = a ^ b;
    // assign o_carry = a & b;

  /* primitive assignment  : 미리 정해져있다 */
    xor(o_sum,a,b);
    and(o_carry,a,b);
endmodule
