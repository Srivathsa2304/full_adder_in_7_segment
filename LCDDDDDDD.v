module push_button( input wire P49, output reg button_pressed);
  
  always @(posedge P49) begin
    button_pressed <=1'b1;
  end
endmodule



module slide_switch( input wire P50, output reg switch_position);
  
  assign switch_position = P50;
endmodule



module seven_segment( input wire [3:0] value, output reg [6:0] segment, output reg dp);
  always @(value) begin
    case(value)
      4'd0: segment = 7'b1000000;
      4'd1: segment = 7'b1111001;
      4'd2: segment = 7'b0100100;
      4'd3: segment = 7'b0110000;
      4'd4: segment = 7'b0011001;
      4'd5: segment = 7'b0010010;
      4'd6: segment = 7'b0000010;
      4'd7: segment = 7'b1111000;
      4'd8: segment = 7'b0000000;
      4'd9: segment = 7'b0011000;
      default:segment = 7'b1111111;
    endcase
  end
  assign dp=1'b0;
endmodule
