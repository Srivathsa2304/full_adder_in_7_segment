************Testbench:************

module upcounter_testbench();
reg clk, reset;
wire [7:0] counter;

UDcounter dut(clk, reset, counter);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1;
#20;
reset=0;
end
endmodule
