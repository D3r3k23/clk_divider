
`timescale 1us / 1ns

module clk_divider_tb();

    reg  clk_in;
    reg  rst;
    wire clk_out;

    // 1 kHz clock gen
    initial     clk_in = 1'b0;
    always #1ms clk_in <= ~clk_in;

    clk_divider #( .DIV(4) )
    DUT
    (
        .clk_in  ( clk_in  ), // 1000 hz
        .rst     ( rst     ),
        .clk_out ( clk_out )  // 250 hz
    );

    initial begin : test

        rst = 1'b1;
        #100
        rst = 1'b0;
        
        #40ms
        $finish;

    end // test

endmodule // clk_divider_tb
