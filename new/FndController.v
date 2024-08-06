`timescale 1ns / 1ps

module FndController(
    );

endmodule


module decoder_2x4(
    input [1:0] x,
    output reg [3:0] y
);
    always @(x) begin
        // watch x
        case(x)
            2'b00: y = 4'b1110;
            2'b01: y = 4'b1101;
            2'b10: y = 4'b1011;
            2'b11: y = 4'b0111;
        endcase
    end
endmodule

module digitSplitter(
    input [13:0] i_digit,
    output [3:0] o_digit_1,
    output [3:0] o_digit_10,
    output [3:0] o_digit_100,
    output [3:0] o_digit_1000
    );
    assign o_digit_1 = i_digit % 10; // 1의 자리 추출
    assign o_digit_10 = i_digit /10 % 10; // 1의 자리 추출
    assign o_digit_100 = i_digit / 100 % 10; // 1의 자리 추출
    assign o_digit_1000 = i_digit / 1000 % 10; // 1의 자리 추출
endmodule

module mux_4x1(
    input [1:0] sel,
    input [3:0] x0,
    input [3:0] x1,
    input [3:0] x2,
    input [3:0] x3,
    output reg [3:0] y
);
    // always @(sel,x0,x1,x2,x3) begin
    always @(*) begin
        case(sel)
            2'b00: y=x0;
            2'b01: y=x1;
            2'b10: y=x2;
            2'b11: y=x3;
        endcase
    end
endmodule

module counter(
    input           clk,
    input           reset,
    output [1:0]    count
);
    reg [1:0] r_counter;
    assign count = r_counter;

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            r_counter <= 0;
        end else begin
            if(r_counter == 3) begin
                r_counter <= 0;
            end else begin
                r_counter <= r_counter + 1;
            end
        end
    end

endmodule

module clkDiv(
    input clk,
    input reset,
    output o_clk
);
reg [16:0] r_counter;
reg r_clk;
assign o_clk = r_clk;

// 100MHz to 1KHz
always @(posedge clk,posedge reset) begin
    if(reset) begin
        r_counter <= 0;
        r_clk <= 1'b0;
    end else begin
        if(r_counter == 100_000 -1) begin
            r_counter <= 0;
            r_clk <= 1'b1;
        end else begin
            r_counter <= r_counter + 1;
            r_clk <= 1'b0;
        end
    end
end

endmodule