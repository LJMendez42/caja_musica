`timescale 1ns / 1ps
`define SIMULATION

module sim_div_frecuencia;

//variables de entrada
reg s_clk = 0;
reg signed [31:0] s_freq = 0;
//variables de salida
wire s_clk_out;

parameter stop_time = 40000000;

divisor_frecuencia div1(.clk(s_clk),.freq(s_freq), .clk_out(s_clk_out));

initial # stop_time $finish;

initial begin
    s_freq = 1174;
    #20000000;
    s_freq = 0;
    #20000000;
end

always
    #10 s_clk = ~s_clk;

initial begin: TEST_WAVE
	
$dumpfile("sim_div_frecuencia.vcd");
$dumpvars(-1,div1);

end

endmodule
