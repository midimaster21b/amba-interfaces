interface axis_if #(parameter
		    TDATA_BYTES=4,
		    TID_BITS=1,
		    TDEST_BITS=1,
		    TUSER_BITS=1) (input aclk, aresetn);

   logic tvalid;
   logic tready;
   logic [(TDATA_BYTES*8)-1:0] tdata;
   logic [TDATA_BYTES-1:0]     tstrb;
   logic [TDATA_BYTES-1:0]     tkeep;
   logic                       tlast;
   logic [TID_BITS-1:0]        tid;
   logic [TDEST_BITS-1:0]      tdest;
   logic [TUSER_BITS-1:0]      tuser;

   modport master (input  tready, output tvalid, tdata, tstrb, tkeep, tlast, tid, tdest, tuser);
   modport slave  (output tready, input  tvalid, tdata, tstrb, tkeep, tlast, tid, tdest, tuser);

endinterface // axis_if
