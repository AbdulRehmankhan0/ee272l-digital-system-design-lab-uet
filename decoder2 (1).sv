module decoder2 (
    input  logic [2:0] sel,
    output logic [7:0] an     // active-low anodes
);

    // Inverted select lines
    logic ns0, ns1, ns2;

    not (ns0, sel[0]);
    not (ns1, sel[1]);
    not (ns2, sel[2]);

    // POS equations (active-low)

    // an[7] = AN0, sel = 000
    or (an[7], sel[2], sel[1], sel[0]);

    // an[6] = AN1, sel = 001
    or (an[6], sel[2], sel[1], ns0);

    // an[5] = AN2, sel = 010
    or (an[5], sel[2], ns1, sel[0]);

    // an[4] = AN3, sel = 011
    or (an[4], sel[2], ns1, ns0);

    // an[3] = AN4, sel = 100
    or (an[3], ns2, sel[1], sel[0]);

    // an[2] = AN5, sel = 101
    or (an[2], ns2, sel[1], ns0);

    // an[1] = AN6, sel = 110
    or (an[1], ns2, ns1, sel[0]);

    // an[0] = AN7, sel = 111
    or (an[0], ns2, ns1, ns0);

endmodule