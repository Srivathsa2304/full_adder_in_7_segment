module full_adder_7seg(
    input wire [3:0] a,
    input wire [3:0] b,
    output reg [6:0] seg,
    output reg dp
);

wire [3:0] sum;
assign sum = a + b;

assign seg = (sum == 4'b0000) ? 7'b1111110 :
             (sum == 4'b0001) ? 7'b0110000 :
             (sum == 4'b0010) ? 7'b1101101 :
             (sum == 4'b0011) ? 7'b1111001 :
             (sum == 4'b0100) ? 7'b0110011 :
             (sum == 4'b0101) ? 7'b1011011 :
             (sum == 4'b0110) ? 7'b1011111 :
             (sum == 4'b0111) ? 7'b1110000 :
             (sum == 4'b1000) ? 7'b1111111 :
             (sum == 4'b1001) ? 7'b1111011 :
             (sum == 4'b1010) ? 7'b1110111 :
             (sum == 4'b1011) ? 7'b0011111 :
             (sum == 4'b1100) ? 7'b1001110 :
             (sum == 4'b1101) ? 7'b0111101 :
             (sum == 4'b1110) ? 7'b1001111 :
             (sum == 4'b1111) ? 7'b1000111 :
             7'b0000000;

assign dp = (sum > 4'b1001) ? 1'b1 : 1'b0;

endmodule
