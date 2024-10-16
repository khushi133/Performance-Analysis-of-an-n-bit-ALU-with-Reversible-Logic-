`timescale 1ns / 1ps

module mux (
    input wire [5:0] D,    // 6-bit data input
    input wire [2:0] S,    // 3-bit select input
    output wire Y
);

    wire P0, P1, P2, P3, P4;
    wire S0, S1, S2;

    cog gate0 (.B(D[0]), .C(D[1]), .A(S[2]), .P(), .Q(P0), .R());  // Select between D[0] and D[1]
    cog gate1 (.B(D[2]), .C(D[3]), .A(S[2]), .P(), .Q(P1), .R());  // Select between D[2] and D[3]
    cog gate2 (.B(D[4]), .C(D[5]), .A(S[2]), .P(), .Q(P2), .R());  // Select between D[4] and D[5]

    cog gate3 (.B(P0), .C(P1), .A(S[1]), .P(), .Q(P3), .R());      // Select between P0 and P1
    cog gate4 (.B(P2), .C(1'b0), .A(S[1]), .P(), .Q(P4), .R());      // Select between P2 and 0 (since we have only 6 inputs)

    cog gate5 (.B(P3), .C(P4), .A(S[0]), .P(), .Q(Y), .R());         // Select the final Y output

endmodule
