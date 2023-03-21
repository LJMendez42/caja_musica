`timescale 1ns / 1ps
`define SIMULATION

module sim_principal;

//variables de entrada
reg s_clk = 0;
reg s_reset = 0;
reg [6:0] s_teclas;
//variables de salida
wire s_clk_out;

parameter stop_time = 10000000;

localparam period = 2000000;  

principal caja_mus(.clk(s_clk),.reset(s_reset),.teclas(s_teclas), .clk_out(s_clk_out));


initial begin
  s_clk = 0;
  s_reset = 0;
  s_teclas = 7'b0000000;
  forever #10 s_clk = ~s_clk;
  end

initial begin 
    s_teclas = 7'b1000000; #period
    s_teclas = 7'b0100000; #period
    s_teclas = 7'b0010000; #period
    s_teclas = 7'b0001000; #period
    s_teclas = 7'b0000100; #period
    s_teclas = 7'b0000010; #period
    s_teclas = 7'b0000001; #period  
    $finish;  
end

initial begin: TEST_WAVE
	
$dumpfile("sim_principal.vcd");
$dumpvars(-1,caja_mus);

end
 
endmodule
