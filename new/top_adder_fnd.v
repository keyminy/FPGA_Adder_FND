`timescale 1ns / 1ps

module top_adder_fnd(
        input clk,
        input reset,
        input [7:0] a,
        input [7:0] b,
        // input [1:0] fndSel,
        output [3:0] fndCom,
        output [7:0] fndFont
        //output carry // no need
    );
    wire [7:0] w_sum;
    wire w_carry;
    wire [1:0] w_select;
    wire [3:0] w_dig_1,w_dig_10,w_dig_100,w_dig_1000;
    wire [3:0] w_digit;
    // /assign fndCom = 4'b0;
    wire w_clk_1khz;

    clkDiv U_ClkDiv(
        .clk(clk),
        .reset(reset),
        .o_clk(w_clk_1khz)
    );

    counter U_Counter(
        .clk(w_clk_1khz),
        .reset(reset),
        .count(w_select)
    );
    mux_4x1 U_Mux_4x1(
        .sel(w_select),
        .x0(w_dig_1),
        .x1(w_dig_10),
        .x2(w_dig_100),
        .x3(w_dig_1000),
        .y(w_digit)
    );

    decoder_2x4 U_Decoder_2x4(
        .x(w_select),
        .y(fndCom)
    );

    fulladd8 U_Adder8(
       .a(a),
       .b(b),
        // output
        .carry(w_carry),
        .sum(w_sum)
    );

    // full_adder4 U_Adder (
    //     .a(a),
    //     .b(b),
    //     .c_in(1'b0),
    //     // output
    //     .carry(w_carry),
    //     .sum(w_sum)
    // );
    digitSplitter U_DigSplitter(
        .i_digit({5'b0,w_carry,w_sum}),
        .o_digit_1(w_dig_1),
        .o_digit_10(w_dig_10),
        .o_digit_100(w_dig_100),
        .o_digit_1000(w_dig_1000)
    );


    BCD2SEG U_Bcd2Seg(
        .bcd(w_digit),
        .seg(fndFont)
    );
endmodule
