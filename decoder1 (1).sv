module decoder1(
    input logic  [3:0] r,
    output logic [6:0] seg   
);
// Segment decoder (gate level SOP) 1=OFF(active-low)
    // Defining not (BARS)
    wire nr0 , nr1 , nr2 , nr3;
    not(nr0, r[0]);
    not(nr1, r[1]);
    not(nr2, r[2]);
    not(nr3, r[3]);

    // Segment a:
    wire a1,a2,a3,a4;
    and(a1, nr3, nr2, nr1, r[0]);
    and(a2, r[3], nr2, r[1], r[0]);
    and(a3, nr3, r[2], nr1, nr0);
    and(a4, r[3], r[2], nr1, r[0]);
    or(seg[6], a1, a2, a3, a4);

    // Segment b:
    logic b1,b2,b3,b4,b5,b6;
    and(b1, nr3, r[2], nr1, r[0]);       
    and(b2, r[3], nr2, r[1], r[0]);
    and(b3, r[3], r[2], r[1], nr0);
    and(b4, r[3], r[2], r[1], r[0]);
    and(b5, r[3], r[2], nr1, nr0);
    and(b6, nr3, r[2], r[1], nr0);
    or(seg[5], b1, b2, b3, b4, b5, b6);

    // Segment c:
    logic c1,c2,c3,c4;
    and(c1, nr3, nr2, r[1], nr0);
    and(c2, r[3], r[2], nr1, nr0);
    and(c3, r[3], r[2], r[1], nr0);
    and(c4, r[3], r[2], r[1], r[0]);
    or(seg[4], c1, c2, c3, c4);

    // Segment d:
    logic d1,d2,d3,d4,d5;
    and(d1, nr3, nr2, nr1, r[0]);
    and(d2, nr3, r[2], nr1, nr0);
    and(d3, r[3], nr2, r[1], nr0);
    and(d4, nr3, r[2], r[1], r[0]);
    and(d5, r[3], r[2], r[1], r[0]);
    or(seg[3], d1, d2, d3, d4, d5);

    // Segment e:
    logic e1,e2,e3,e4,e5,e6;
    and(e1, nr3, nr2, nr1, r[0]);
    and(e2, nr3, r[2], nr1, r[0]);
    and(e3, nr3, r[2], nr1, nr0);
    and(e4, nr3, r[2], r[1], r[0]);
    and(e5, nr3, nr2, r[1], r[0]); 
    and(e6, r[3], nr2, nr1, r[0]);
    or(seg[2], e1, e2, e3, e4, e5, e6);

    // Segment f:
    logic f1,f2,f3,f4,f5;
    and(f1, nr3, nr2, nr1, r[0]);
    and(f2, nr3, nr2, r[1], r[0]);
    and(f3, nr3, r[2], r[1], r[0]);
    and(f4, r[3], r[2], nr1, r[0]);
    and(f5, nr3, nr2, r[1], nr0);
    or(seg[1], f1, f2, f3, f4, f5);

    // Segment g:
    logic g1,g2,g3,g4;
    and(g1, nr3, nr2, nr1, nr0);
    and(g2, nr3, nr2, nr1, r[0]);
    and(g3, nr3, r[2], r[1], r[0]);
    and(g4, r[3], r[2], nr1, nr0);
    or(seg[0], g1, g2, g3, g4);

endmodule