module ControlUnit(
    input [3:0] opcode,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write
);

always @(*) begin

    reg_write = 0;
    mem_read  = 0;
    mem_write = 0;

    case(opcode)

        4'b0001,
        4'b0010,
        4'b0011,
        4'b0100,
        4'b0101,
        4'b0110:
            reg_write = 1;

        4'b0111: begin
            reg_write = 1;
            mem_read  = 1;
        end

        4'b1000:
            mem_write = 1;

    endcase
end

endmodule