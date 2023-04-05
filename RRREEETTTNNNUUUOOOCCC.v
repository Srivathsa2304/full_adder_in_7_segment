******DUT:******

module UDcounter(input clk, reset, output[7:0] counter);
reg [7:0] counter_up;

// up counter
always @(posedge clk or posedge reset)
begin
if(reset|counter==7'd99)
counter_up <= 7'd0;
else
counter_up <= counter_up + 7'd1;
end
assign counter = counter_up;
endmodule
