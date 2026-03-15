module shifter_4bit (
    input logic [3:0]A,
    input logic s0, s1,
    output logic [3:0]C
);

logic T3, T2, T1, T0;

    // S1

    // T0
    mux2to1 ms10(.x(A[0]), .y(1'b0), .sel(s1), .z(T0));
    //T1
    mux2to1 ms11(.x(A[1]), .y(1'b0), .sel(s1), .z(T1));
    //T2
    mux2to1 ms12(.x(A[2]), .y(A[0]), .sel(s1), .z(T2));
    //T3
    mux2to1 ms13(.x(A[3]), .y(A[1]), .sel(s1), .z(T3));


    //S0

    //C0
    mux2to1 ms00(.x(T0), .y(1'b0), .sel(s0), .z(C[0]));
    //c1
    mux2to1 ms01(.x(T1), .y(T0), .sel(s0), .z(C[1]));
    //c1
    mux2to1 ms02(.x(T2), .y(T1), .sel(s0), .z(C[2]));
    //c1
    mux2to1 ms03(.x(T3), .y(T2), .sel(s0), .z(C[3]));

endmodule