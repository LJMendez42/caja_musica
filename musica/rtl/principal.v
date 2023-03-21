`timescale 1ns / 1ps
`include "divisor_frecuencia.v"

module principal (
	input clk,
	input reset,
	input [6:0] teclas,
   	output clk_out
	);
//frecuencia deseada		
	
parameter freq_prueba = 1000;
wire senal_prueba;
parameter freq_DO = 1046;
wire senal_do;
parameter freq_RE = 1174;
wire senal_re;
parameter freq_MI = 1318;
wire senal_mi;
parameter freq_FA = 1396;
wire senal_fa;
parameter freq_SOL = 1567;
wire senal_sol;
parameter freq_LA = 1760;
wire senal_la;
parameter freq_SI = 1975;
wire senal_si;

reg senal_salida;

divisor_frecuencia div_do(.clk(clk), .freq(freq_DO), .clk_out(senal_do));
divisor_frecuencia div_re(.clk(clk), .freq(freq_RE), .clk_out(senal_re));
divisor_frecuencia div_mi(.clk(clk), .freq(freq_MI), .clk_out(senal_mi));
divisor_frecuencia div_fa(.clk(clk), .freq(freq_FA), .clk_out(senal_fa));
divisor_frecuencia div_sol(.clk(clk), .freq(freq_SOL), .clk_out(senal_sol));
divisor_frecuencia div_la(.clk(clk), .freq(freq_LA), .clk_out(senal_la));
divisor_frecuencia div_si(.clk(clk), .freq(freq_SI), .clk_out(senal_si));


always @(clk or teclas or reset)
if(reset == 1'b0)
begin
	if(teclas[0]==1'b1)
	begin
		 senal_salida <= senal_do;
	end
	else if (teclas[1]==1'b1)
	begin
		 senal_salida <= senal_re;
	end
	else if (teclas[2]==1'b1)
	begin
		 senal_salida <= senal_mi;
	end
	else if (teclas[3]==1'b1)
	begin
		 senal_salida <= senal_fa;
	end
	else if (teclas[4]==1'b1)
	begin
		 senal_salida <= senal_sol;
	end
	else if (teclas[5]==1'b1)
	begin
		 senal_salida <= senal_la;
	end
	else if (teclas[6]==1'b1)
	begin
		 senal_salida <= senal_si;
	end
	else
	begin
		 senal_salida <= 0;
	end
end
else 
begin
 senal_salida <= 0;
end

assign clk_out	 = senal_salida;


endmodule
