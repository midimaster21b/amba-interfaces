interface axi4_if #(parameter
		    DATA_BYTES=4,
		    ADDR_BYTES=4,
		    NUM_ID_BITS=4,
		    NUM_USER_BITS=4
		    ) (input aclk, aresetn);

   localparam NUM_DATA_BITS   = DATA_BYTES*8;
   localparam NUM_ADDR_BITS   = ADDR_BYTES*8;
   localparam NUM_STRB_BITS   = DATA_BYTES;
   localparam NUM_SIZE_BITS   = 3;
   localparam NUM_CACHE_BITS  = 4;
   localparam NUM_PROT_BITS   = 3;
   localparam NUM_REGION_BITS = 4;
   localparam NUM_BURST_BITS  = 2;
   localparam NUM_LEN_BITS    = 8;
   localparam NUM_QOS_BITS    = 4;
   localparam NUM_RESP_BITS   = 2;
   localparam NUM_LOCK_BITS   = 1;
   localparam NUM_LAST_BITS   = 1;

   // Write address channel
   logic		       awvalid;
   logic		       awready;
   logic [NUM_ADDR_BITS-1:0]   awaddr; // 32-bits by spec
   logic [NUM_SIZE_BITS-1:0]   awsize;
   logic [NUM_CACHE_BITS-1:0]  awcache;
   logic [NUM_PROT_BITS-1:0]   awprot;
   logic		       awlock;
   logic [NUM_REGION_BITS-1:0] awregion;
   logic [NUM_BURST_BITS-1:0]  awburst;
   logic [NUM_ID_BITS-1:0]     awid;
   logic [NUM_LEN_BITS-1:0]    awlen;
   logic [NUM_QOS_BITS-1:0]    awqos;
   logic [NUM_USER_BITS-1:0]   awuser;


   // Write data channel
   logic		       wvalid;
   logic		       wready;
   logic		       wlast;
   logic [NUM_DATA_BITS-1:0]   wdata;
   logic [NUM_STRB_BITS-1:0]   wstrb;
   logic [NUM_USER_BITS-1:0]   wuser;

   // Write response channel
   logic		       bvalid;
   logic		       bready;
   logic [NUM_RESP_BITS-1:0]   bresp;
   logic [NUM_ID_BITS-1:0]     bid;
   logic [NUM_USER_BITS-1:0]   buser;

   // Read address channel
   logic		       arvalid;
   logic		       arready;
   logic [NUM_ADDR_BITS-1:0]   araddr;
   logic [NUM_CACHE_BITS-1:0]  arcache;
   logic [NUM_PROT_BITS-1:0]   arprot;
   logic		       arlock;
   logic [NUM_REGION_BITS-1:0] arregion;
   logic [NUM_SIZE_BITS-1:0]   arsize;
   logic [NUM_BURST_BITS-1:0]  arburst;
   logic [NUM_ID_BITS-1:0]     arid;
   logic [NUM_LEN_BITS-1:0]    arlen;
   logic [NUM_QOS_BITS-1:0]    arqos;
   logic [NUM_USER_BITS-1:0]   aruser;

   // Read data channel
   logic		       rvalid;
   logic		       rready;
   logic		       rlast;
   logic [NUM_DATA_BITS-1:0]   rdata;
   logic [NUM_RESP_BITS-1:0]   rresp;
   logic [NUM_ID_BITS-1:0]     rid;
   logic [NUM_USER_BITS-1:0]   ruser;

   modport master (input  awready, wready, bvalid, bresp, bid, buser, arready,
		   rvalid, rlast, rdata, rresp, rid, ruser,
		   output awvalid, awaddr, awsize, awcache, awprot, awlock,
		   awregion, awburst, awid, awlen, awqos, awuser, wvalid, wlast,
		   wdata, wstrb, wuser, bready, arvalid, araddr, arcache,
		   arprot, arlock, arregion, arsize, arburst, arid, arlen,
		   arqos, aruser, rready);

   modport slave  (output awready, wready, bvalid, bresp, bid, buser, arready,
		   rvalid, rlast, rdata, rresp, rid, ruser,
		   input  awvalid, awaddr, awsize, awcache, awprot, awlock,
		   awregion, awburst, awid, awlen, awqos, awuser, wvalid, wlast,
		   wdata, wstrb, wuser, bready, arvalid, araddr, arcache,
		   arprot, arlock, arregion, arsize, arburst, arid, arlen,
		   arqos, aruser, rready);


endinterface // axi4_if
