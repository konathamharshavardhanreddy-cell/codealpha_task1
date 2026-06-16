`timescale 1ns/1ps

module testbench;

reg clk;
reg reset;
reg emergency;
wire [2:0] light;

traffic_light_controller uut(
    .clk(clk),
    .reset(reset),
    .emergency(emergency),
    .light(light)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    emergency = 0;

    #10 reset = 0;

    #100 emergency = 1;

    #20 emergency = 0;

    #100 $finish;
end

endmodule