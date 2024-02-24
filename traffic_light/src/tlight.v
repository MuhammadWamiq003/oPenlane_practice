module light (clk,rst,Red,Yellow,Green);

    input wire clk;
    input wire rst;

    output reg Red;
    output reg Yellow;
    output reg Green;

    reg [1:0] count3;

    localparam RED = 2'b00;
    localparam YELLOW = 2'b01;
    localparam GREEN = 2'b10;

    reg [1:0]state;
    reg [1:0]nextstate;

    always @(posedge clk ) begin
        if (rst) begin
            state <= RED;
            count3 <= 1'b0;
        end
        else begin
            state <= nextstate;
            if (count3 == 2'b11) begin
                count3 <= 2'b0;
            end
            else begin
                count3 <= count3 +1;
            end
        end
    end

    always @(*)begin
        case (state)
            RED :begin
                if (count3 == 2'b11) begin
                nextstate = YELLOW;
                Red = 1'b1;
                Yellow = 1'b0;
                Green = 1'b0;
                end
            end 
            YELLOW : begin
                if (count3 == 2'b11) begin
                nextstate = GREEN;
                Red = 1'b0;
                Yellow = 1'b1;
                Green = 1'b0;
                end
            end 
            GREEN : begin
                if (count3 == 2'b11) begin
                nextstate = RED;
                Red = 1'b0;
                Yellow = 1'b0;
                Green = 1'b1;
                end
            end 
            
            default : nextstate = RED;
        endcase
    end

endmodule
