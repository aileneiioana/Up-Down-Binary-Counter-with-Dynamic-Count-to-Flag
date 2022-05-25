//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Ailenei Ioana
// Data        : Martie 28, 2022
//---------------------------------------------------------------------------------------
// Descriere   : Generator semnale clock si reset
//---------------------------------------------------------------------------------------


module ck_rst_tb (
  output reg   clk   , 
  output reg   reset   
);

  initial begin
    clk = 1'b0; 
    forever #5 clk = ~clk;
  end

  initial begin
    reset  <= 1'b1;  
    @(posedge clk);

    reset  <= 1'b0;
    @(posedge clk);
    
    reset  <= 1'b1;  
    @(posedge clk);
  end

endmodule 

