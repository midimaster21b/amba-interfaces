// AMBA 3 APB Protocol v2.0
// This comes from the document "ARM IHI 0024C" (ID042910) - the C revision
// From April 13, 2010
//
// - Added pprot & pstrb signals

// PPROT
// PPROT[0] - Normal or Privileged. Low for normal, high for privileged
// PPROT[1] - Secure or Non-secure. Low for secure, high for non-secure
// PPROT[2] - Data or Instruction. Low for data, high for instructions
interface apb_if_rev_c #(parameter
			  ADDR_WIDTH=32,
			  DATA_WIDTH=32
			 ) (input pclk, presetn);

   logic     [ADDR_WIDTH-1:0] paddr;   // address
   logic                [2:0] pprot;   // protection
   logic                      pselx;   // select line (similar to spi)
   logic                      penable;
   logic                      pwrite;  // indicates write when high, read when low
   logic     [DATA_WIDTH-1:0] pwdata;
   logic [(DATA_WIDTH/8)-1:0] pstrb;   // Added in this revision
   logic                      pready;
   logic     [DATA_WIDTH-1:0] prdata;
   logic                      pslverr;

   modport master (input  pready, prdata, pslverr, output paddr, pprot, pselx, penable, pwrite, pwdata, pstrb);
   modport slave  (output pready, prdata, pslverr, input  paddr, pprot, pselx, penable, pwrite, pwdata, pstrb);

endinterface // apb_if_rev_c
