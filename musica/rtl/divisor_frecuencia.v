
module divisor_frecuencia(
    input clk,
    input wire signed [31:0] freq,	
    output reg clk_out
    );
//frecuencia fpga 50MHz
parameter freq_in = 50000000;

//numero de ciclos que vamos a contar
//wire signed [31:0] N_ciclos = freq_in/(2*freq);

reg [25:0] cuenta = 26'b0;

//inicializo variables
initial begin 
cuenta = 26'b0;
clk_out = 0;
end 


always @(posedge clk) begin

    if (freq != 32'b0)
    begin
	    if(cuenta==(freq_in/(2*freq)))
	    begin
		clk_out = ~clk_out;
		cuenta = 0;
	    end
	    else
	    begin
		cuenta = cuenta + 1;
	    end
    end
    else
    begin 
    	clk_out = 0;
    end
    
    
end
    
    
endmodule
