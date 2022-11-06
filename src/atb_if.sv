interface atb_if #(parameter
		   ATBYTES_WIDTH=1,
		   ATDATA_WIDTH=32
		   ) (input atclk, atclken, atresetn);
   // Data signals
   logic [ATBYTES_WIDTH-1:0] atbytes;
   logic [ATDATA_WIDTH-1:0]  atdata;
   logic [6:0]		     atid;
   logic		     atready;
   logic		     atvalid;

   // Flush control signals
   logic		     afvalid;
   logic		     afready;

   modport master (input  atready, afvalid, output atbytes, atdata, atid, atvalid, afready);
   modport slave  (output atready, afvalid, input  atbytes, atdata, atid, atvalid, afready);

endinterface // atb_if
