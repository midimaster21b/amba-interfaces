interface axi3_if #(parameter
		    DATA_BYTES=4,
		    ADDR_BYTES=4,
		    NUM_ID_BITS_P=4
		    ) (input aclk, aresetn);

   // Write address channel
   logic		       awvalid;
   logic		       awready;
   logic [(ADDR_BYTES*8)-1:0]  awaddr; // 32-bits by spec
   logic [2:0]		       awsize;
   logic [3:0]		       awcache;
   logic [2:0]		       awprot;
   logic [1:0]		       awlock;
   logic [1:0]		       awburst;
   logic [NUM_ID_BITS_P-1:0]   awid;
   logic [3:0]		       awlen;

   // Write data channel
   logic		       wvalid;
   logic		       wready;
   logic		       wlast;
   logic [(DATA_BYTES*8)-1:0]  wdata;
   logic [DATA_BYTES-1:0]      wstrb;
   logic [NUM_ID_BITS_P-1:0]   wid;

   // Write response channel
   logic		       bwvalid;
   logic		       bwready;
   logic [1:0]		       bresp;
   logic [NUM_ID_BITS_P-1:0]   bid;

   // Read address channel
   logic		       arvalid;
   logic		       aready;
   logic [(ADDR_BYTES*8)-1:0]  araddr; // 32-bit by spec
   logic [3:0]		       arcache;
   logic [2:0]		       arprot;
   logic [1:0]		       arlock;
   logic [2:0]		       arsize;
   logic [1:0]		       arburst;
   logic [NUM_ID_BITS_P-1:0]   arid;
   logic [3:0]		       arlen;

   // Read data channel
   logic		       rvalid;
   logic		       rready;
   logic		       rlast;
   logic [(DATA_BYTES*8)-1:0]  rdata;
   logic [1:0]		       rresp;
   logic [NUM_ID_BITS_P-1:0]   rid;

   modport master (input  awready, wready, bwvalid, bresp, bid, aready,
		   rvalid, rlast, rdata, rresp, rid,
		   output awvalid, awaddr, awsize, awcache, awprot, awlock,
		   awburst, awid, awlen, wvalid, wlast,
		   wdata, wstrb, wid, bwready, arvalid, araddr, arcache,
		   arprot, arlock, arsize, arburst, arid, arlen, rready);

   modport slave  (output awready, wready, bwvalid, bresp, bid, aready,
		   rvalid, rlast, rdata, rresp, rid,
		   input  awvalid, awaddr, awsize, awcache, awprot, awlock,
		   awburst, awid, awlen, wvalid, wlast,
		   wdata, wstrb, wid, bwready, arvalid, araddr, arcache,
		   arprot, arlock, arsize, arburst, arid, arlen, rready);


endinterface // axi3_if
