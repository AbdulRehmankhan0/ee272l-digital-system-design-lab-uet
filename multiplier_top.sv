module multiplier_top(

    input logic [3:0]X,
    input logic [2:0]sel,
    output logic [3:0]P,
    output logic [6:0] seg,

    output logic [7:0] an
);


    logic [3:0]A_s;
    shifter_4bit shift(.A(X),.s0(1'b1), .s1(1'b0), .C(A_s));



    
    multiplier C3BM (.A(X), .B(A_s), .Sum(P));

    decoder1 D7s(.r(P), .seg(seg));



    decoder2 an_dec (
        .sel(sel),
        .an(an)
    );





endmodule