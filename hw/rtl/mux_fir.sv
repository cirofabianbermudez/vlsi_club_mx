module mux_fir #(
    parameter int bits_I = 3,
    BitsX = 16
) (
    input [bits_I-1:0] I,  //Selector del MUX
    input signed [BitsX-1:0] DATTA,  //Datos de la señal discretizada
    input [BitsX-1:0] REG1,  //X(k-1)
    input [BitsX-1:0] REG2,  //X(k-2)
    input [BitsX-1:0] REG3,  //X(k-3)
    input [BitsX-1:0] REG4,  //X(k-4)
    input [BitsX-1:0] REG5,  //X(k-5)
    output reg [BitsX-1:0] X  //Salida hacia el MAC

);

  always_comb
    case (I)
      1: X = REG5;
      2: X = REG4;
      3: X = REG3;
      4: X = REG2;
      5: X = REG1;
      6: X = DATTA;
      default X = 0;
    endcase

endmodule
