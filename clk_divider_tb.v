
`timescale 1us / 1ns

module clk_divider_tb;

    // Inputs
    reg  clk_in;
    reg  rst;
    
    // Output
    wire clk_out;

    // 1 kHz clock gen
    initial     clk_in = 1'b0;
    always #500 clk_in <= ~clk_in; // 1 ms period

    clk_divider #( .DIV(10) ) DUT
    (
        .clk_in  ( clk_in  ), // 1000 Hz
        .rst     ( rst     ),
        .clk_out ( clk_out )  // 100 Hz
    );

    initial begin : test

        rst = 1'b1;
        #2000
        rst = 1'b0;
        
        #60000
        $finish;

    end // test

endmodule // clk_divider_tb
