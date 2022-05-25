//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Ailenei Ioana
// Data        : Martie 28, 2022
//---------------------------------------------------------------------------------------
// Descriere   : 
//---------------------------------------------------------------------------------------


module DW03_bictr_dcnto_test;

    parameter               WIDTH = 'd4;

    wire                    clk     ; 
    wire                    reset   ;
    wire                    load    ;
    wire                    cen     ; 
    wire                    up_dn   ; 
    wire [WIDTH-1 : 0]      data    ;
    wire [WIDTH-1 : 0]      count_to;
    
    DW03_bictr_dcnto #(
        .WIDTH     (WIDTH)
    ) DUT(
        .clk      (clk     ), 
        .reset    (reset   ), 
        .load     (load    ), 
        .cen      (cen     ),
        .up_dn    (up_dn   ), 
        .data     (data    ),
        .count_to (count_to),
        .tercnt   (tercnt  ),         
        .count    (count   ) 
    );

    DW03_bictr_dcnto_tb #(
        .WIDTH     (WIDTH)
    ) i_DW03_bictr_dcnto_tb (
        .clk      (clk     ), 
        .reset    (reset   ), 
        .load     (load    ), 
        .cen      (cen     ),
        .up_dn    (up_dn   ), 
        .data     (data    ),
        .count_to (count_to) 
    );

    ck_rst_tb i_ck_rst_tb ( 
        .clk   (clk     ),
        .reset (reset   )
    ); 

endmodule 