module full_adder4(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output carry,
    output [3:0] sum
);
    wire [3:0] w_carry;

    full_adder fa0(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .o_sum(sum[0]),
        .o_carry(w_carry[0])
    );

    full_adder fa1(
        .a(a[1]),
        .b(b[1]),
        .c_in(w_carry[0]),
        .o_sum(sum[1]),
        .o_carry(w_carry[1])
    );

    full_adder fa2(
        .a(a[2]),
        .b(b[2]),
        .c_in(w_carry[1]),
        .o_sum(sum[2]),
        .o_carry(w_carry[2])
    );

    full_adder fa3(
        .a(a[3]),
        .b(b[3]),
        .c_in(w_carry[2]),
        .o_sum(sum[3]),
        .o_carry(w_carry[3])
    );

    assign carry = w_carry[3];

endmodule