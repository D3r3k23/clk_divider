
// Produces clk_out with the frequency of clk_in
// divided by DIV <- multiples of 2
module clk_divider
#(parameter
    integer DIV = 2
)(
    input wire clk_in,
    input wire rst,
    output reg clk_out
);

    localparam integer TC = (DIV / 2) - 1; // Terminal count
    integer count; // 32 bits

    wire terminate = (count == TC); // --> Reset counter, trigger clk_out edge

    always @( posedge clk_in )
    begin
        if (rst | terminate)
            count <= 0;
        else
            count <= count + 1;
        
        if (rst)
            clk_out <= 0;
        else if (terminate)
            clk_out <= ~clk_out;
    end

endmodule // clk_divider
