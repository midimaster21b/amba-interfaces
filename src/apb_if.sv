interface apb_if (input pclk, presetn);

   logic [31:0] paddr;
   logic	pselx;
   logic	penable;
   logic	pwrite;
   logic [31:0] prdata;
   logic [31:0] pwdata;

   modport master (input  prdata, output paddr, pselx, penable, pwrite, pwdata);
   modport slave  (output prdata, input  paddr, pselx, penable, pwrite, pwdata);

endinterface // apb_if
