interface ahb_if (input hclk, hresetn);

   logic [31:0] haddr;
   logic [1:0]	htrans;
   logic	hwrite;
   logic [2:0]	hsize;
   logic [2:0]	hburst;
   logic [3:0]	hprot;
   logic [31:0] hwdata;
   logic	hselx;
   logic [31:0] hrdata;
   logic	hready;
   logic [1:0]	hresp;

   logic	hbusreqx;
   logic	hlockx;
   logic	hgrantx;
   logic [3:0]	hmaster;
   logic	hmastlock;
   logic [15:0] hsplitx;

endinterface // ahb_if
