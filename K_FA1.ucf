module adder4bit(input [3:0] A, input [3:0] B, input Cin, output [3:0] S, output Cout);

    assign S = A + B + Cin;
    assign Cout = (A[3]&B[3]) | (A[3]&Cin) | (B[3]&Cin);

endmodule
