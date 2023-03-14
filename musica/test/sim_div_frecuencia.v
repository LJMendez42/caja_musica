`timescale 1ns / 1ps
`define SIMULATION

module sim_div_frecuencia;

//variables de entrada
reg s_clk = 0;
//variables de salida
wire s_clk_out;

parameter stop_time = 10000000;

divisor_frecuencia div1(s_clk, s_clk_out);

initial # stop_time $finish;

always
    #20 s_clk = ~s_clk;
initial begin: TEST_WAVE

$dumpfile("sim_div_frecuencia.vcd");
$dumpvars(-1,div1);

end

endmodule
