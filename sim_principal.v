`timescale 1ns / 1ps
`define SIMULATION

module sim_div_frecuencia;

//variables de entrada
reg s_clk = 0;
reg [6:0] s_teclas;
//variables de salida
wire s_clk_out;

parameter stop_time = 10000000;

principal caja_mus(.clk(s_clk),.teclas(s_teclas), .clk_out(s_clk_out));

 
initial begin
  s_clk = 0;
  s_teclas = 7'b0000000;
  forever #20 s_clk = ~s_clk;
  end
 
initial begin 
    s_teclas = 7'b1000000; #20
    s_teclas = 7'b0100000; #40
    s_teclas = 7'b0010000; #20
    s_teclas = 7'b0001000; #10
    s_teclas = 7'b0000100; #1
    s_teclas = 7'b0000010; #1
    s_teclas = 7'b0000001; #40  
    # 1000000 $finish; 
 $dumpfile("sim_principal.vcd");
 $dumpvars(-1,caja_mus);
 
end

endmodule
