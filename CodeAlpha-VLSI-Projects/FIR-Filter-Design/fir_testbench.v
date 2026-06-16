`timescale 1ns/1ps

module fir_testbench;

reg clk;
reg reset;
reg [7:0] x;
wire [15:0] y;

fir_filter uut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    x = 0;

    #10 reset = 0;

    #10 x = 10;
    #10 x = 20;
    #10 x = 30;
    #10 x = 40;
    #10 x = 50;

    #50 x = 60;
    #50 x = 70;

    #100 $finish;
end

initial
begin
    $monitor("Time=%0t Input=%d Output=%d",
             $time, x, y);
end

endmodule