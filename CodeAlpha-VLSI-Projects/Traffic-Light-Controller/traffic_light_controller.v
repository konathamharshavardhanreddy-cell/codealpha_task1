module traffic_light_controller(
    input clk,
    input reset,
    input emergency,
    output reg [2:0] light
);

parameter RED    = 3'b100;
parameter YELLOW = 3'b010;
parameter GREEN  = 3'b001;

reg [1:0] state;
reg [3:0] timer;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= 0;
        timer <= 0;
        light <= RED;
    end
    else if(emergency)
    begin
        light <= GREEN;
    end
    else
    begin
        timer <= timer + 1;

        case(state)

        0: begin
            light <= RED;
            if(timer == 5)
            begin
                state <= 1;
                timer <= 0;
            end
        end

        1: begin
            light <= GREEN;
            if(timer == 5)
            begin
                state <= 2;
                timer <= 0;
            end
        end

        2: begin
            light <= YELLOW;
            if(timer == 2)
            begin
                state <= 0;
                timer <= 0;
            end
        end

        endcase
    end
end

endmodule