module RegisterFile(
    input clk,
    input we,
    input [1:0] rd_addr,
    input [1:0] rs_addr,
    input [3:0] write_data,
    output [3:0] rd_data,
    output [3:0] rs_data
);

reg [3:0] regs[3:0];

assign rd_data = regs[rd_addr];
assign rs_data = regs[rs_addr];

always @(posedge clk)
begin
    if(we)
        regs[rd_addr] <= write_data;
end

endmodule