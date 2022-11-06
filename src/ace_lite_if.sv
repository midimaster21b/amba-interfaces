interface ace_lite_if #(parameter
			DATA_BYTES=4,
			USER_BITS=1,
			ID_BITS=1
			);

   // Write address channel
   logic [ID_BITS-1:0]   awid;
   logic [48:0]		 awaddr;
   logic [7:0]		 awlen;
   logic [2:0]		 awsize;
   logic [1:0]		 awburst;
   logic		 awlock;
   logic [3:0]		 awcache;
   logic [2:0]		 awprot;
   logic		 awvalid;
   logic [3:0]		 awregion;
   logic [3:0]		 awqos;
   logic [2:0]		 awsnoop;
   logic [1:0]		 awbar;
   logic [1:0]		 awdomain;
   logic [USER_BITS-1:0] awuser;
   logic		 awready;


   // Write data channel
   logic [(DATA_BYTES*8)-1:0] wdata;
   logic [DATA_BYTES-1:0]     wstrb;
   logic		      wlast;
   logic		      wvalid;
   logic [USER_BITS-1:0]      wuser;
   logic		      wready;


   // Write response channel
   logic [ID_BITS-1:0]	      bid;
   logic [1:0]		      bresp;
   logic		      bvalid;
   logic [USER_BITS-1:0]      buser;
   logic		      bready;


   // Read address channel
   logic [ID_BITS-1:0]	      arid;
   logic [48:0]		      araddr;
   logic [7:0]		      arlen;
   logic [2:0]		      arsize;
   logic [1:0]		      arburst;
   logic		      arlock;
   logic [3:0]		      arcache;
   logic [2:0]		      arprot;
   logic		      arvalid;
   logic [3:0]		      arregion;
   logic [3:0]		      arqos;
   logic [3:0]		      arsnoop;
   logic [1:0]		      arbar;
   logic [1:0]		      ardomain;
   logic [USER_BITS-1:0]      aruser;
   logic		      arready;


   // Read data channel
   logic [ID_BITS-1:0]	      rid;
   logic [(DATA_BYTES*8)-1:0] rdata;
   logic [1:0]		      rresp;
   logic		      rlast;
   logic		      rvalid;
   logic [USER_BITS-1:0]      ruser;
   logic		      rready;


   // Snoop address channel
   logic [43:0]		      acaddr;
   logic [2:0]		      acprot;
   logic		      acvalid;
   logic [3:0]		      acsnoop;
   logic		      acready;


   // Snoop response channel
   logic [4:0]		      crresp;
   logic		      crvalid;
   logic		      crready;


endinterface // ace_lite_if
