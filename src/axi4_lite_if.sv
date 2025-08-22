interface axi4_lite_if #(parameter
			 DATA_BYTES=4,
			 ADDR_BYTES=4) (input aclk, aresetn);

   localparam NUM_ADDR_BITS  = ADDR_BYTES*8;
   localparam NUM_DATA_BITS  = DATA_BYTES*8;
   localparam NUM_STRB_BITS  = DATA_BYTES;
   localparam NUM_RESP_BITS  = 2;
   localparam NUM_PROT_BITS  = 3;

   // Write address channel
   logic awvalid;
   logic awready;
   logic [NUM_ADDR_BITS-1:0] awaddr;
   logic [NUM_PROT_BITS-1:0] awprot;

   // Write data channel
   logic wvalid;
   logic wready;
   logic [NUM_DATA_BITS-1:0] wdata;
   logic [NUM_STRB_BITS-1:0] wstrb;

   // Write response channel
   logic bvalid;
   logic bready;
   logic [NUM_RESP_BITS-1:0] bresp;

   // Read address channel
   logic arvalid;
   logic arready;
   logic [NUM_ADDR_BITS-1:0] araddr;
   logic [NUM_PROT_BITS-1:0] arprot;

   // Read data channel
   logic rvalid;
   logic rready;
   logic [NUM_DATA_BITS-1:0] rdata;
   logic [NUM_RESP_BITS-1:0] rresp;


   modport master (input  awready, wready, bvalid, bresp, arready, rvalid, rdata, rresp,
		   output awvalid, awaddr, awprot, wvalid,
		   wdata, wstrb, bready, arvalid, araddr, arprot, rready);

   modport slave  (output awready, wready, bvalid, bresp, arready, rvalid, rdata, rresp,
		   input  awvalid, awaddr, awprot, wvalid,
		   wdata, wstrb, bready, arvalid, araddr, arprot, rready);

endinterface // axi4_lite_if
