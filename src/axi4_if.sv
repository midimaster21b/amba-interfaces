interface axi4_if #(parameter
		    DATA_BYTES=4,
		    ADDR_BYTES=4,
		    NUM_ID_BITS_P=4,
		    NUM_USER_BITS_P=4
		    ) (input aclk, aresetn);

   // Write address channel
   logic		       awvalid;
   logic		       awready;
   logic [(ADDR_BYTES*8)-1:0]  awaddr; // 32-bits by spec
   logic [2:0]		       awsize;
   logic [3:0]		       awcache;
   logic [2:0]		       awprot;
   logic		       awlock;
   logic [3:0]		       awregion;
   logic [1:0]		       awburst;
   logic [NUM_ID_BITS_P-1:0]   awid;
   logic [7:0]		       awlen;
   logic [3:0]		       awqos;
   logic [NUM_USER_BITS_P-1:0] awuser;


   // Write data channel
   logic		       wvalid;
   logic		       wready;
   logic		       wlast;
   logic [(DATA_BYTES*8)-1:0]  wdata;
   logic [DATA_BYTES-1:0]      wstrb;
   logic [NUM_USER_BITS_P-1:0] wuser;

   // Write response channel
   logic		       bvalid;
   logic		       bready;
   logic [1:0]		       bresp;
   logic [NUM_ID_BITS_P-1:0]   bid;
   logic [NUM_USER_BITS_P-1:0] buser;

   // Read address channel
   logic		       arvalid;
   logic		       arready;
   logic [(ADDR_BYTES*8)-1:0]  araddr;
   logic [3:0]		       arcache;
   logic [2:0]		       arprot;
   logic		       arlock;
   logic [3:0]		       arregion;
   logic [2:0]		       arsize;
   logic [1:0]		       arburst;
   logic [NUM_ID_BITS_P-1:0]   arid;
   logic [7:0]		       arlen;
   logic [3:0]		       arqos;
   logic [NUM_USER_BITS_P-1:0] aruser;

   // Read data channel
   logic		       rvalid;
   logic		       rready;
   logic		       rlast;
   logic [(DATA_BYTES*8)-1:0]  rdata;
   logic [1:0]		       rresp;
   logic [NUM_ID_BITS_P-1:0]   rid;
   logic [NUM_USER_BITS_P-1:0] ruser;

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
