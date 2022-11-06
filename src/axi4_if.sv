interface axi4_if #(parameter
		    DATA_BYTES=4,
		    ADDR_BYTES=4) (input aclk, aresetn);

   // Write address channel
   logic [3:0]                awid;
   logic [(ADDR_BYTES*8)-1:0] awaddr;
   logic [3:0]                awlen;
   logic [3:0]                awsize;
   logic [1:0]                awburst;
   logic [1:0]                awlock;
   logic [3:0]                awcache;
   logic [2:0]		      awprot;
   logic		      awvalid;
   logic		      awready;

   // Write data channel
   logic [3:0]		      wid;
   logic [(DATA_BYTES*8)-1:0] wdata;
   logic [DATA_BYTES-1:0]     wstrb;
   logic		      wlast;
   logic		      wvalid;
   logic		      wready;

   // Write response channel
   logic [3:0]		      bid;
   logic [1:0]		      bresp;
   logic		      bvalid;
   logic		      bready;

   // Read address channel
   logic [3:0]		      arid;
   logic [(ADDR_BYTES*8)-1:0] araddr;
   logic [3:0]		      arlen;
   logic [2:0]		      arsize;
   logic [1:0]		      arburst;
   logic [1:0]		      arlock;
   logic [3:0]		      arcache;
   logic [2:0]		      arprot;
   logic		      arvalid;
   logic		      arready;

   // Read data channel
   logic [3:0]		      rid;
   logic [(DATA_BYTES*8)-1:0] rdata;
   logic [1:0]		      rresp;
   logic		      rlast;
   logic		      rvalid;
   logic		      rready;

   modport master (input  awready, wready, bid, bresp, bvalid, arready, rid, rdata, rresp, rlast, rvalid,
		   output awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awvalid,
		   wid, wdata, wstrb, wlast, wvalid, bready, arid, araddr, arlen, arsize, arburst,
		   arlock, arcache, arprot, arvalid, rready);

   modport slave  (output awready, wready, bid, bresp, bvalid, arready, rid, rdata, rresp, rlast, rvalid,
		   input  awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awvalid,
		   wid, wdata, wstrb, wlast, wvalid, bready, arid, araddr, arlen, arsize, arburst,
		   arlock, arcache, arprot, arvalid, rready);

endinterface // axi4_lite_if
