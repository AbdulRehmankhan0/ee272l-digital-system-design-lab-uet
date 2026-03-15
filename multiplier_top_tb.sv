module multiplier_top_tb;

    // Inputs
    logic [3:0] X;
    logic [2:0] sel;       // select anode (binary)
    logic [3:0] P;
    // Outputs
    logic [6:0] seg;
    logic [7:0] an;

    // Instantiate the multiplier
    multiplier_top uut (
        .X(X),
        .sel(sel),
        .P(P),
        .seg(seg),
        .an(an)
    );

    initial begin
        $display("X\tsel\tseg\tan");

        // Test Case 1
        X = 4'd3;      // example input
        sel = 3'b000;  // brighten AN0
        #10;
        $display("%b\t%b\t%b\t%b", X, sel, seg, an);

        // Test Case 2
        X = 4'd5;      // another example input
        sel = 3'b101;  // brighten AN5
        #10;
        $display("%b\t%b\t%b\t%b", X, sel, seg, an);

        $display("Finished 2 test cases for anode brightness");
        $finish;
    end

endmodule