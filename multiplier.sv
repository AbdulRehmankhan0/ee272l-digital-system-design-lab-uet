module multiplier (
    input  logic [3:0] A,
    input  logic [3:0] B,
    output logic [3:0] Sum
);

    //wires
    logic c1, c2, c3;


    logic k0, k1, k2;
    logic l1, l2;
    logic m1, m2;

    //bit0
    xor (Sum[0], A[0], B[0]);
    and (k0, A[0], B[0]);
    or  (c1, k0);

    //bit1
    xor (Sum[1], A[1], B[1], c1);
    and (k1, A[1], B[1]);
    and (l1, A[1], c1);
    and (m1, B[1], c1);
    or  (c2, k1, l1, m1);

    //bit2
    xor (Sum[2], A[2], B[2], c2);
    and (k2, A[2], B[2]);
    and (l2, A[2], c2);
    and (m2, B[2], c2);
    or  (c3, k2, l2, m2);

    //bit3
    xor (Sum[3], A[3], B[3], c3);

endmodule