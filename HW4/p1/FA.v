module FA_4bit( //DO NOT modify interface
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output       Cout,
    output [3:0] S
); 

   // TODO: gate-level 4bit full adder //
   // Internal carry wires between the 1-bit adders
    wire C1, C2, C3;

    // Instantiate 1-bit full adders for each bit of A and B
// 呼叫FA_1bit這個func 命名為Full_Adder_0
    FA_1bit Full_Adder_0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Cout(C1),
        .S(S[0])
    );

    FA_1bit Full_Adder_1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C1),
        .Cout(C2),
        .S(S[1])
    );

    FA_1bit Full_Adder_2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C2),
        .Cout(C3),
        .S(S[2])
    );

    FA_1bit Full_Adder_3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C3),
        .Cout(Cout),
        .S(S[3])
    );

endmodule

module FA_1bit(
    input  A,
    input  B,
    input  Cin,
    output Cout,
    output S
);

    // TODO: gate-level 1bit full adder //
    wire w1, w2, w3;    // 內部線路
    
    xor xor1(S, A, B, Cin);    // S = A ⊕ B ⊕ Cin
    
    and and1(w1, A, B);    // w1 = A·B
    and and2(w2, B, Cin);    // w2 = B·Cin
    and and3(w3, A, Cin); // w3 = A·Cin
    or  or1(Cout, w1, w2, w3); // Cout = w1 + w2 + w3 = AB + BCin + ACin

endmodule