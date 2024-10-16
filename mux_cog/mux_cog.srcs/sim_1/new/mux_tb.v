`timescale 1ns / 1ps

module mux_tb;

    reg [5:0] D;
    reg [2:0] S;
    wire Y;

    mux uut (
        .D(D),
        .S(S),
        .Y(Y)
    );

    initial begin
        D = 6'b000001; S = 3'b000; #10; 
        D = 6'b000010; S = 3'b001; #10; 
        D = 6'b101101; S = 3'b010; #10; 
        D = 6'b001000; S = 3'b011; #10; 
        D = 6'b010000; S = 3'b100; #10; 
        D = 6'b101101; S = 3'b101; #10; 
        D = 6'b111111; S = 3'b110; #10; 
        D = 6'b111111; S = 3'b111; #10; 
        $finish;
    end

    initial begin
        $monitor("At time %t: D = %b, S = %b, Y = %b", $time, D, S, Y);
    end

endmodule
