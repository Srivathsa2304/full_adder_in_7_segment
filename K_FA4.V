module top(input [3:0] A, input [3:0] B, input Cin, output reg [6:0] seg);

    wire [3:0] sum;
    wire Cout;

    adder4bit adder(.A(A), .B(B), .Cin(Cin), .S(sum), .Cout(Cout));
    display display(.value(sum), .seg(seg));

endmodule
