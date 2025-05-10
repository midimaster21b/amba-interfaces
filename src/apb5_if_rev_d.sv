// AMBA APB5 Protocol
// This comes from the document "ARM IHI 0024D" (ID041221) - the D revision
// From April 9, 2021
//
// New in this revision:
// - pwakeup
// - pauser
// - pwuser
// - pruser
// - pbuser

// PPROT
// PPROT[0] - Normal or Privileged. Low for normal, high for privileged
// PPROT[1] - Secure or Non-secure. Low for secure, high for non-secure
// PPROT[2] - Data or Instruction. Low for data, high for instructions
interface apb5_rev_d_if (input pclk, presetn);

   logic      [ADDR_WIDTH-1:0] paddr;   // address
   logic                 [2:0] pprot;   // protection
   logic                       pselx;   // select line (similar to spi)
   logic                       penable;
   logic                       pwrite;  // indicates write when high, read when low
   logic      [DATA_WIDTH-1:0] pwdata;
   logic  [(DATA_WIDTH/8)-1:0] pstrb;   // Added in this revision
   logic                       pready;
   logic                [31:0] prdata;
   logic                       pslverr;
   logic                       pwakeup; // New in this revision
   logic  [USER_REQ_WIDTH-1:0] pauser;  // New in this revision
   logic [USER_DATA_WIDTH-1:0] pwuser;  // New in this revision
   logic [USER_DATA_WIDTH-1:0] pruser;  // New in this revision
   logic [USER_RESP_WIDTH-1:0] pbuser;  // New in this revision

   modport master (input  pready, prdata, pslverr, pruser, pbuser, output paddr, pprot, pselx, penable, pwrite, pwdata, pstrb, pwakeup, pauser, pwuser);
   modport slave  (output pready, prdata, pslverr, pruser, pbuser, input  paddr, pprot, pselx, penable, pwrite, pwdata, pstrb, pwakeup, pauser, pwuser);

endinterface // apb5_rev_d_if
