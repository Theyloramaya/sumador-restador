/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module SumadorCompleto (
  input A,
  input B,
  input Cin,
  output Cout,
  output S
);
  wire s0;
  assign s0 = (A ^ B);
  assign Cout = ((A & B) | (s0 & Cin));
  assign S = (s0 ^ Cin);
endmodule

module Circuito_final (
  input Sign,
  output S0,
  output S1,
  output S2
);
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  assign s3 = (1'b0 ^ Sign);
  assign s5 = (1'b0 ^ Sign);
  assign s6 = (1'b0 ^ Sign);
  SumadorCompleto SumadorCompleto_i0 (
    .A( 1'b0 ),
    .B( s3 ),
    .Cin( Sign ),
    .Cout( s4 ),
    .S( S0 )
  );
  SumadorCompleto SumadorCompleto_i1 (
    .A( 1'b0 ),
    .B( s5 ),
    .Cin( s4 ),
    .Cout( s7 ),
    .S( S1 )
  );
  SumadorCompleto SumadorCompleto_i2 (
    .A( 1'b0 ),
    .B( s6 ),
    .Cin( s7 ),
    .S( S2 )
  );
endmodule