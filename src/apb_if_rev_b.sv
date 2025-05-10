// AMBA 3 APB Protocol v1.0 (second version)
// This comes from the document "ARM IHI 0024B" - the B revision
// From August 17, 2004

interface apb_rev_b_if (input pclk, presetn);

   logic [31:0] paddr;
   logic	pselx;
   logic	penable;
   logic	pwrite;
   logic [31:0] pwdata;
   logic        pready;
   logic [31:0] prdata;
   logic        pslverr;

   modport master (input  pready, prdata, pslverr, output paddr, pselx, penable, pwrite, pwdata);
   modport slave  (output pready, prdata, pslverr, input  paddr, pselx, penable, pwrite, pwdata);

endinterface // apb_rev_b_if
