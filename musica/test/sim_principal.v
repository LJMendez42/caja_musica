`timescale 1ns / 1ps
`define SIMULATION

module sim_principal;

//variables de entrada
reg s_clk = 0;
reg s_reset = 0;
reg [6:0] s_teclas;
//variables de salida
wire s_clk_out;
integer i;
integer f;
parameter n_indata = 10;
localparam period = 2000000;  
reg [6:0] datos_entrada [(n_indata-1):0];
time datos_salida[n_indata:0];

time time1;
time time2;
time s_clk_period;


principal caja_mus(.clk(s_clk),.reset(s_reset),.teclas(s_teclas), .clk_out(s_clk_out));

initial begin
  s_clk = 0;
  s_reset = 1'b0;
  s_teclas = 7'b0000000;
  forever #10 s_clk = ~s_clk;
  end
initial begin
f = $fopen("./output.txt","w");
end

initial begin 
    $readmemb("datos_prueba.txt",datos_entrada);
    $fwrite(f,"periodo\n");
    for (i = 0; i < n_indata; i = i + 1)
    begin 
	s_teclas = datos_entrada[i];
	#(period);
	if (s_teclas != 7'b0000000)
	begin
	@(posedge s_clk_out)
	time1=$realtime;

	@(negedge s_clk_out)
	time2=$realtime;

	@(posedge s_clk_out)
	s_clk_period = (time2 - time1)*2;
	$display(s_clk_period);
	datos_salida[i] = s_clk_period;
	$fwrite(f,"%t\n", datos_salida[i]);
	end
	else
	begin
	$display(0);
	datos_salida[i] = 0;
	$fwrite(f,"%t\n", datos_salida[i]);
	end
    end    
    $fclose(f); 
    $finish;  
end 


initial begin: TEST_WAVE
	
$dumpfile("sim_principal.vcd");
$dumpvars(-1,caja_mus);

end
 
endmodule
