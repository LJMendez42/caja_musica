`timescale 1ns / 1ps
`include "musica/rtl/divisor_frecuencia.v"

module principal (
	input clk,
	input reset,
	input [6:0] teclas,
   	output clk_out
	);
//frecuencia deseada

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


reg signed [31:0] s_freq = 0;
wire senal_divisor;

divisor_frecuencia divisor(.clk(clk), .freq(s_freq), .clk_out(senal_divisor));


always @(clk or teclas or reset)

if(reset == 1'b0)
begin
	if(teclas[0]==1'b1)
	begin
		s_freq <= 1046;
	end
	else if (teclas[1]==1'b1)
	begin
		s_freq <= 1174;
	end
	else if (teclas[2]==1'b1)
	begin
		s_freq <= 1318;
	end
	else if (teclas[3]==1'b1)
	begin
		s_freq <= 1396;
	end
	else if (teclas[4]==1'b1)
	begin
		s_freq <= 1567;
	end
	else if (teclas[5]==1'b1)
	begin
		s_freq <= 1760;
	end
	else if (teclas[6]==1'b1)
	begin
		s_freq <= 1975;
	end
	else
	begin
		s_freq <= 0;			
	end
end

assign clk_out	 = senal_divisor;

endmodule
