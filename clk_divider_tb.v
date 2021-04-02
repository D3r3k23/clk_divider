
`timescale 1ns / 1ps

module clk_divider_tb();

    reg  clk_in;
    reg  rst;
    wire clk_out;

    // 100 MHz clock gen
    initial   clk_in = 1'b0;
    always #5 clk_in <= ~clk_in;

    clk_divider dut
    (
        .clk_in  ( clk_in   ),
        .rst     ( rst      ),
        .clk_div ( 1000     ),
        .clk_out ( clk_out  )  // 100 kHz
    );

    initial begin : test

        rst = 1'b1;
        #50
        rst = 1'b0;
        
        #80000
        $finish;

    end // test

endmodule // clk_divider_tb
