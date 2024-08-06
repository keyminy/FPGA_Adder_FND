`timescale 1ns / 1ps

module fulladd8(
    // input [15:0] sw,
    // output [8:0] led,
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum,
    output carry
//    input c_in,//c_in 존재 x
    );
    wire [7:0] w_carry;

    full_adder4 fa4_0(
        .a(a[3:0]),
        .b(b[3:0]),
        .c_in(1'b0),
        .sum(sum[3:0]),
        .carry(w_carry)
    );

    full_adder4 fa4_1(
        .a(a[7:4]),
        .b(b[7:4]),
        .c_in(w_carry), //0로부터 넘어오는 carry
        .sum(sum[7:4]),
        .carry(carry) // 8bit fulladd의 밖으로 나오는 output carry
    );
endmodule
