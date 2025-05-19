// AMBA AXI Protocol v2.0
// Pulled from document "ARM IHI 0022C" (ID030610)
// March 03, 2010

interface axi2_if #(parameter
		    NUM_DATA_BITS_P=32,
		    NUM_ADDR_BITS_P=32,
		    NUM_ID_BITS_P=4,
		    NUM_BURST_BITS_P=4
		    ) (input aclk, aresetn);

   logic [NUM_ID_BITS_P-1:0]	     arid;
   logic [NUM_ADDR_BITS_P-1:0] 	     araddr;
   logic [NUM_BURST_BITS_P-1:0]      arlen;
   logic [2:0] 			     arsize;
   logic [1:0] 			     arburst;
   logic [1:0] 			     arlock;
   logic [3:0] 			     arcache;
   logic [2:0] 			     arprot;
   logic			     arvalid;
   logic			     arready;

   logic [NUM_ID_BITS_P-1:0] 	     rid;
   logic [NUM_DATA_BITS_P-1:0] 	     rdata;
   logic [1:0] 			     rresp;
   logic			     rlast;
   logic			     rvalid;
   logic			     rready;

   logic [NUM_ID_BITS_P-1:0] 	     awid;
   logic [NUM_ADDR_BITS_P-1:0] 	     awaddr;
   logic [NUM_BURST_BITS_P-1:0]      awlen;
   logic [2:0] 			     awsize;
   logic [1:0] 			     awburst;
   logic [1:0] 			     awlock;
   logic [3:0] 			     awcache;
   logic [2:0] 			     awprot;
   logic			     awvalid;
   logic			     awready;

   logic [NUM_ID_BITS_P-1:0] 	     wid;
   logic [NUM_DATA_BITS_P-1:0] 	     wdata;
   logic [(NUM_DATA_BITS_P/8)-1:0]   wstrb;
   logic			     wlast;
   logic			     wvalid;
   logic			     wready;

   logic			     bready;
   logic [NUM_ID_BITS_P-1:0] 	     bid;
   logic [1 downto 0] 		     bresp;
   logic			     bvalid;


   modport master (input awready, wready, bid, bresp, bvalid, arready, rready,
		   output awid, awaddr, awlen, awsize, awburst, awlock, awcache,
		   awprot, awvalid, wid, wdata, wstrb, wlast, wvalid, bready,
		   arid, araddr, arlen, arsize, arburst, arlock, arcache,
		   arprot, arvalid, rid, rdata, rresp, rlast, rvalid
		   );

   modport slave (output awready, wready, bid, bresp, bvalid, arready, rready,
		  input awid, awaddr, awlen, awsize, awburst, awlock, awcache,
		  awprot, awvalid, wid, wdata, wstrb, wlast, wvalid, bready,
		  arid, araddr, arlen, arsize, arburst, arlock, arcache,
		  arprot, arvalid, rid, rdata, rresp, rlast, rvalid
		  );

endinterface // axi2_if
