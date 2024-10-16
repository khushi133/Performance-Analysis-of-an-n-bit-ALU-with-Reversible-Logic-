`timescale 1ns / 1ps
module adder_subtractor_dkg(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout,
    output Difference,
    output Borrow
);
    wire P, Q, R, S, X, Y;
    dkg adder (
        .A(1'b0),
        .B(A),
        .C(Cin),
        .D(B),
        .P(P),
        .Q(Q),
        .R(R),
        .S(S)
    );
    dkg subtractor (
        .A(1'b1),
        .B(A),
        .C(Cin),
        .D(B),
        .P(P),
        .Q(Q),
        .R(Y),
        .S(X)
    );
    assign Sum = S;
    assign Cout = R;
    assign Difference = X;
    assign Borrow = Y;
endmodule
