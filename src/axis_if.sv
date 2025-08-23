interface axis_if #(parameter
		    TDATA_BYTES=4,
		    TID_BITS=1,
		    TDEST_BITS=1,
		    TUSER_BITS=1) (input aclk, aresetn);

   localparam NUM_DATA_BITS  = TDATA_BYTES*8;
   localparam NUM_STRB_BITS  = TDATA_BYTES;
   localparam NUM_KEEP_BITS  = NUM_STRB_BITS;
   localparam NUM_ID_BITS    = TID_BITS;
   localparam NUM_DEST_BITS  = TDEST_BITS;
   localparam NUM_USER_BITS  = TUSER_BITS;
   localparam NUM_LAST_BITS  = 1;

   logic tvalid;
   logic tready;
   logic [NUM_DATA_BITS-1:0] tdata;
   logic [NUM_STRB_BITS-1:0] tstrb;
   logic [NUM_KEEP_BITS-1:0] tkeep;
   logic		     tlast;
   logic [NUM_ID_BITS-1:0]   tid;
   logic [NUM_DEST_BITS-1:0] tdest;
   logic [NUM_USER_BITS-1:0] tuser;

   modport master (input  tready, output tvalid, tdata, tstrb, tkeep, tlast, tid, tdest, tuser);
   modport slave  (output tready, input  tvalid, tdata, tstrb, tkeep, tlast, tid, tdest, tuser);

endinterface // axis_if
