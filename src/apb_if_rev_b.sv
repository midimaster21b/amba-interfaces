// AMBA 3 APB Protocol v1.0 (second version)
// This comes from the document "ARM IHI 0024B" - the B revision
// From August 17, 2004

interface apb_if_rev_b #(parameter
			  ADDR_WIDTH=32,
			  DATA_WIDTH=32
			 ) (input pclk, presetn);

   logic [ADDR_WIDTH-1:0] paddr;
   logic                  pselx;
   logic                  penable;
   logic                  pwrite;
   logic [DATA_WIDTH-1:0] pwdata;
   logic                  pready;
   logic [DATA_WIDTH-1:0] prdata;
   logic                  pslverr;

   modport master (input  pready, prdata, pslverr, output paddr, pselx, penable, pwrite, pwdata);
   modport slave  (output pready, prdata, pslverr, input  paddr, pselx, penable, pwrite, pwdata);

endinterface // apb_if_rev_b
