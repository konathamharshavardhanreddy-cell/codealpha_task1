module fir_filter(
    input clk,
    input reset,
    input [7:0] x,
    output reg [15:0] y
);

reg [7:0] x0, x1, x2, x3;

// FIR Coefficients: 1, 2, 3, 4

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        x0 <= 0;
        x1 <= 0;
        x2 <= 0;
        x3 <= 0;
        y <= 0;
    end
    else
    begin
        x3 <= x2;
        x2 <= x1;
        x1 <= x0;
        x0 <= x;

        y <= (x0 * 1) +
             (x1 * 2) +
             (x2 * 3) +
             (x3 * 4);
    end
end

endmodule