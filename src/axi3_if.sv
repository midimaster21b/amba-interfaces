interface axi3_if #(parameter
		    DATA_BYTES=4,
		    ADDR_BYTES=4,
		    NUM_ID_BITS_P=4
		    ) (input aclk, aresetn);

   localparam int BRESP_OKAY   = 0; // [2'b00] Transaction successful
   localparam int BRESP_EXOKAY = 1; // [2'b01] Exclusive write succesful
   localparam int BRESP_SLVERR = 2; // [2'b10] Slave error detected
   localparam int BRESP_DECERR = 3; // [2'b11] Decode error detected (doesn't correspond to valid address)

   /**************************************************************************
    * AXI3 burst types:
    * 0. Fixed bursts write all data to the same address. These bursts are
    *    commonly used for interacting with a FIFO.
    * 1. Increment bursts increment the write address after each transfer.
    *    Increment bursts are commonly used for writing or reading  large
    *    portions of memory.
    * 2. Wrap bursts increment from the starting address after each transfer,
    *    similar to increment bursts, up to a specified size offset and then
    *    the address wraps back to the starting address.
    **************************************************************************/
   localparam int BURST_FIXED  = 0; // [2'b00]
   localparam int BURST_INCR   = 1; // [2'b01]
   localparam int BURST_WRAP   = 2; // [2'b10]
   localparam int BURST_RSVRD  = 3; // [2'b11] Reserved for future protocols


   // Write address channel
   logic		       awvalid;
   logic		       awready;
   logic [(ADDR_BYTES*8)-1:0]  awaddr; // 32-bits by spec
   logic [2:0]		       awsize; // num bytes per transfer beat
   logic [3:0]		       awcache;
   logic [2:0]		       awprot;
   logic [1:0]		       awlock;
   logic [1:0]		       awburst;
   logic [NUM_ID_BITS_P-1:0]   awid;
   logic [3:0]		       awlen;  // num beats in burst transfer

   // Write data channel
   logic		       wvalid;
   logic		       wready;
   logic		       wlast;
   logic [(DATA_BYTES*8)-1:0]  wdata;
   logic [DATA_BYTES-1:0]      wstrb;
   logic [NUM_ID_BITS_P-1:0]   wid;

   // Write response channel
   logic		       bvalid;
   logic		       bready;
   logic [1:0]		       bresp;
   logic [NUM_ID_BITS_P-1:0]   bid;

   // Read address channel
   logic		       arvalid;
   logic		       arready;
   logic [(ADDR_BYTES*8)-1:0]  araddr; // 32-bit by spec
   logic [3:0]		       arcache;
   logic [2:0]		       arprot;
   logic [1:0]		       arlock;
   logic [2:0]		       arsize; // num bytes per transfer beat
   logic [1:0]		       arburst;
   logic [NUM_ID_BITS_P-1:0]   arid;
   logic [3:0]		       arlen;  // num beats in burst transfer

   // Read data channel
   logic		       rvalid;
   logic		       rready;
   logic		       rlast;
   logic [(DATA_BYTES*8)-1:0]  rdata;
   logic [1:0]		       rresp;
   logic [NUM_ID_BITS_P-1:0]   rid;

   modport master (input  awready, wready, bvalid, bresp, bid, arready,
		   rvalid, rlast, rdata, rresp, rid,
		   output awvalid, awaddr, awsize, awcache, awprot, awlock,
		   awburst, awid, awlen, wvalid, wlast,
		   wdata, wstrb, wid, bready, arvalid, araddr, arcache,
		   arprot, arlock, arsize, arburst, arid, arlen, rready);

   modport slave  (output awready, wready, bvalid, bresp, bid, arready,
		   rvalid, rlast, rdata, rresp, rid,
		   input  awvalid, awaddr, awsize, awcache, awprot, awlock,
		   awburst, awid, awlen, wvalid, wlast,
		   wdata, wstrb, wid, bready, arvalid, araddr, arcache,
		   arprot, arlock, arsize, arburst, arid, arlen, rready);


endinterface // axi3_if
