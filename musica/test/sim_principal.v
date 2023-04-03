`timescale 1ns / 1ps
`define SIMULATION

module sim_principal;

//variables de entrada
reg s_clk = 0;
reg s_reset = 0;
reg [6:0] s_teclas;

//variables de salida
wire s_clk_out;

//archivos
integer archivo_salida;
reg [6:0] datos_entrada [(n_indata-1):0];
reg [25:0]tiempos_prueba [(n_indata-1):0];
time datos_salida[n_indata:0];

//enteros
integer i;
parameter n_indata = 100;
localparam period = 2000000;  

//variables para tiempo 
reg [20:0] numero;
reg frecuencia;
time time0;
time time1;
time time2;
time periodo_senal;
time n_ciclos;
time tiempo_extra;
time tiempo_prueba;
principal caja_mus(.clk(s_clk),.reset(s_reset),.teclas(s_teclas), .clk_out(s_clk_out));


//valores iniciales
initial begin
  s_clk = 0;
  s_reset = 1'b0;
  s_teclas = 7'b0000000;
  forever #10 s_clk = ~s_clk;
end
  
 //leer y abrir archivos 
initial begin
    archivo_salida = $fopen("./output.txt","w");
    $readmemb("datos_prueba.txt",datos_entrada);
    $readmemb("tiempos_prueba.txt",tiempos_prueba);
end

initial begin  
    for (i = 0; i < n_indata; i = i + 1)
    begin 
    s_teclas = datos_entrada[i];
    //calcular el tiempo   
    tiempo_prueba = tiempos_prueba[i];
    if (datos_entrada[i] != 7'b0)
    begin
	time0 = $realtime;
	@(posedge s_clk_out)
	time1 = $realtime;
	@(negedge s_clk_out)
	time2 = $realtime;
	//calculo del periodo
	periodo_senal = 2*(time2 - time1); 
	$display(periodo_senal);
	//calculo del numero de ciclos 
	if((time2 - time1) != 0)
	begin
	n_ciclos = tiempo_prueba/(2*(time2 - time1)); 
	end
	tiempo_extra = periodo_senal - (tiempo_prueba - (n_ciclos*periodo_senal));
	#((tiempo_prueba - (time2 - time0)) + tiempo_extra);

	//escritura del periodo en el archivotxt
	datos_salida[i] = periodo_senal;
	$fwrite(archivo_salida,"%t\n", datos_salida[i]);
    end
    else
    begin
	#(tiempo_prueba);    
    	$display(0);
	//escritura del periodo en el archivotxt    	
    	datos_salida[i] = 0;
	$fwrite(archivo_salida,"%t\n", datos_salida[i]);
    end 
    end   
    $fclose(archivo_salida); 
    $finish;  
end 
    	

initial begin: TEST_WAVE
	
$dumpfile("sim_principal.vcd");
$dumpvars(-1,caja_mus);

end
 
endmodule
