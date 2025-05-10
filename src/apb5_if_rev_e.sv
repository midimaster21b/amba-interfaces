// AMBA APB5 Protocol
// This comes from the document "ARM IHI 0024E" (ID022823) - the E revision
// From February 28, 2023
//
// New in this revision:
// - RME support added

// PPROT
// PPROT[0] - Normal or Privileged. Low for normal, high for privileged
// PPROT[1] - Secure or Non-secure. Low for secure, high for non-secure
// PPROT[2] - Data or Instruction. Low for data, high for instructions
interface apb5_rev_e_if (input pclk, presetn);

   logic      [ADDR_WIDTH-1:0] paddr;   // address
   logic                 [2:0] pprot;   // protection
   logic                       pnse;    // Added in this revision
   logic                       pselx;   // select line (similar to spi)
   logic                       penable;
   logic                       pwrite;  // indicates write when high, read when low
   logic      [DATA_WIDTH-1:0] pwdata;
   logic  [(DATA_WIDTH/8)-1:0] pstrb;
   logic                       pready;
   logic                [31:0] prdata;
   logic                       pslverr;
   logic                       pwakeup;
   logic  [USER_REQ_WIDTH-1:0] pauser;
   logic [USER_DATA_WIDTH-1:0] pwuser;
   logic [USER_DATA_WIDTH-1:0] pruser;
   logic [USER_RESP_WIDTH-1:0] pbuser;

   modport master (input  pready, prdata, pslverr, pruser, pbuser, output paddr, pprot, pnse, pselx, penable, pwrite, pwdata, pstrb, pwakeup, pauser, pwuser);
   modport slave  (output pready, prdata, pslverr, pruser, pbuser, input  paddr, pprot, pnse, pselx, penable, pwrite, pwdata, pstrb, pwakeup, pauser, pwuser);

endinterface // apb5_rev_e_if
