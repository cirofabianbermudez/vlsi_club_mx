module reg_fir #(
    parameter int BitsX = 16
) (
    input                   clk,
    input                   rst,
    input                   STM,       //empieza el filtrado
    input                   LDX,       //Carga datos de los registros
    input      [BitsX-1:0] DATTA,     //Entrada X(k-n) hacia registros
    output reg [BitsX-1:0] out_regis  //Salida hacia MUX y siguiente registro
);

  reg [BitsX-1:0] almacenado;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      almacenado <= 0;
      out_regis  <= 0;
    end else if (STM) almacenado <= DATTA;

    else almacenado <= almacenado;
  end

  always_ff @(posedge LDX or posedge rst) begin
    if (rst) begin
      almacenado <= 0;
      out_regis  <= 0;
    end else begin
      out_regis <= almacenado;
    end
  end

endmodule
