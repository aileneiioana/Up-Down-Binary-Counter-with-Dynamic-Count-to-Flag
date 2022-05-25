//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Ailenei Ioana
// Data        : Martie 28, 2022
//---------------------------------------------------------------------------------------
// Descriere   : Up/Down Binary Counter with Dynamic Count-to Flag
//---------------------------------------------------------------------------------------


module DW03_bictr_dcnto(
    clk     , 
    reset   ,
    load    , 
    cen     ,
    up_dn   , 
    data    ,
    count_to, 
    tercnt  ,
    count      
);
    parameter  WIDTH =           'd4    ;  // numar de biti ai numaratorului
    input                       clk     ;  // semnal de ceas
    input                       reset   ;  // semnal de reset asincron
    input                       load    ;  // comanda presetare
    input                       cen     ;  // comanda de numarare
    input                       up_dn   ;  // crescator/descrescator
    input      [WIDTH-1 : 0]    data    ;  // data presetare
    input      [WIDTH-1 : 0]    count_to;  // valoare pana la care numaram
    output                      tercnt  ;  // terminare numarare
    output reg [WIDTH-1 : 0]    count   ;  // iesire numarator
    
    always @(posedge(clk) or negedge(reset)) begin
        if(~reset )  count <=  1'b0; else             // resetare asincrona
        if(~load)    count <= data;  else begin       // presetare
        if(cen &  up_dn ) count <= count + 1'b1; else // numarare crescatoare
        if(cen & ~up_dn ) count <= count - 1'b1;      // numarare descrescatoare
        end 
    end  
	assign tercnt = (count==count_to);            // indicator terminare numarare
																			      
endmodule //module DW03_bictr_dcnto