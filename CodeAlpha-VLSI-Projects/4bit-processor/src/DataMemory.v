module DataMemory(
    input clk,
    input mem_write,
    input mem_read,
    input [3:0] addr,
    input [3:0] write_data,
    output reg [3:0] read_data
);

reg [3:0] mem[15:0];

always @(posedge clk)
begin
    if(mem_write)
        mem[addr] <= write_data;
end

always @(*)
begin
    if(mem_read)
        read_data = mem[addr];
    else
        read_data = 4'b0000;
end

endmodule