//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Ailenei Ioana
// Data        : Martie 28, 2022
//---------------------------------------------------------------------------------------
// Descriere   : Generator de stimuli pentru numarator
//---------------------------------------------------------------------------------------


module DW03_bictr_dcnto_tb #( 
    parameter WIDTH = 'd4                  // numar de biti ai numaratorului
)(
    input                         clk   ,  // semnal de ceas
    output                        reset ,  // semnal de reset asincron
    output reg                    load  ,  // comanda presetare
    output reg                    cen   ,  // comanda de numarare
    output reg                    up_dn ,  // crescator/descescator
    output reg  [WIDTH-1 : 0]     data  ,  // data presetare
    output reg  [WIDTH-1 : 0]     count_to
   
);

    initial begin

        
        load        <= 1'b1;
        data        <= {WIDTH{1'bx}};
        count_to    <= {WIDTH{1'bx}};
        up_dn       <= 1'b1;
        cen         <= 1'b0;
        #15;

        load        <= 1'b0;
        up_dn       <= 1'b1;
        cen         <= 1'b0;
        data        <= 'd0;
        count_to    <= 'd4;
        #25;

        load        <= 1'b1;
        up_dn       <= 1'b1;
        cen         <= 1'b0;
        data        <= 'd0;
        count_to    <= 'd4;
        #25;

        load        <= 1'b1;
        up_dn       <= 1'b1;
        cen         <= 1'b1;
        data        <= 'd0;
        count_to    <= 'd8;
        #225;   

        load        <= 1'b1;
        up_dn       <= 1'b0;
        cen         <= 1'b1;
        data        <= 'd0;
        count_to    <= 'd4;
        #100;

        $stop;
        
    end

endmodule