interface axi4_lite_if #(parameter
			 DATA_BYTES=4,
			 ADDR_BYTES=4) (input aclk, aresetn);

   // Write address channel
   logic awvalid;
   logic awready;
   logic [(ADDR_BYTES*8)-1:0] awaddr;
   logic [2:0] awprot;

   // Write data channel
   logic wvalid;
   logic wready;
   logic [(DATA_BYTES*8)-1:0] wdata;
   logic [DATA_BYTES-1:0] wstrb;

   // Write response channel
   logic bvalid;
   logic bready;
   logic [1:0] bresp;

   // Read address channel
   logic arvalid;
   logic arready;
   logic [(ADDR_BYTES*8)-1:0] araddr;
   logic [2:0] arprot;

   // Read data channel
   logic rvalid;
   logic rready;
   logic [(DATA_BYTES*8)-1:0] rdata;
   logic [1:0] rresp;


   modport master (input  awready, wready, bvalid, bresp, arready, rvalid, rdata, rresp,
		   output awvalid, awaddr, awprot, wvalid,
		   wdata, wstrb, bready, arvalid, araddr, arprot, rready);

   modport slave  (output awready, wready, bvalid, bresp, arready, rvalid, rdata, rresp,
		   input  awvalid, awaddr, awprot, wvalid,
		   wdata, wstrb, bready, arvalid, araddr, arprot, rready);

endinterface // axi4_lite_if
