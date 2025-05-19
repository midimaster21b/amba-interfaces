-- AMBA ACE Protocol
-- Pulled from document "ARM IHI 0022E" (ID033013)
-- February 22, 2013
--
-- Naming schemes
-- ace_aw_m2s_t - directional AW signals
-- ace_aw_io_t  - bidirectional AW signals
-- ace_aw_t     - hierarchical AW signals
-- ace_rd_io_t  - bidirectional read channels signals
-- ace_rd_t     - directional hierarchical read channels signals
-- ace_t        - hierarchical with all channels signals

-- Global signals not included in these records:
-- CSYSREQ - System low-power request (from clock controller)
-- CSYSACK - Low-power request acknowledgement (from peripheral device)
-- CACTIVE - Clock active (from peripheral device)

-- Supported data widths (according to protocol):
-- 8, 16, 32, 64, 128, 256, 512, or 1024 bits wide

-- NOTE: The only signal change in this revision is the addition of the signal:
--       - awunique

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ace_lite_rev_e_pkg is
  constant BURST_LENGTH_C : integer := 8;

  -- AxBAR constants
  constant AXBAR_NORMAL_BARRIER     : std_logic_vector(1 downto 0) := "00";
  constant AXBAR_MEM_BARRIER        : std_logic_vector(1 downto 0) := "01";
  constant AXBAR_NORMAL_NO_BARRIER  : std_logic_vector(1 downto 0) := "10";
  constant AXBAR_SYNC_BARRIER       : std_logic_vector(1 downto 0) := "11";

  -- AxDOMAIN constants
  constant AXDOMAIN_NON_SHAREABLE   : std_logic_vector(1 downto 0) := "00";
  constant AXDOMAIN_INNER_SHAREABLE : std_logic_vector(1 downto 0) := "01";
  constant AXDOMAIN_OUTER_SHAREABLE : std_logic_vector(1 downto 0) := "10";
  constant AXDOMAIN_SYSTEM          : std_logic_vector(1 downto 0) := "11";

  -- ACSNOOP constants
  constant ACSNOOP_READ_ONCE_C             : std_logic_vector(3 downto 0) := x"0";
  constant ACSNOOP_READ_SHARED_C           : std_logic_vector(3 downto 0) := x"1";
  constant ACSNOOP_READ_CLEAN_C            : std_logic_vector(3 downto 0) := x"2";
  constant ACSNOOP_READ_NOT_SHARED_DIRTY_C : std_logic_vector(3 downto 0) := x"3";
  constant ACSNOOP_READ_UNIQUE_C           : std_logic_vector(3 downto 0) := x"7";
  constant ACSNOOP_CLEAN_SHARED_C          : std_logic_vector(3 downto 0) := x"8";
  constant ACSNOOP_CLEAN_INVALID_C         : std_logic_vector(3 downto 0) := x"9";
  constant ACSNOOP_MAKE_INVALID_C          : std_logic_vector(3 downto 0) := x"D";
  constant ACSNOOP_DVM_COMPLETE_C          : std_logic_vector(3 downto 0) := x"E";
  constant ACSNOOP_DVM_MESSAGE_C           : std_logic_vector(3 downto 0) := x"F";

  -- CRRESP constants
  constant CRRESP_DATA_TRANSFER_BIT_C      : integer := 0;
  constant CRRESP_ERROR_BIT_C              : integer := 1;
  constant CRRESP_PASS_DIRTY_BIT_C         : integer := 2;
  constant CRRESP_IS_SHARED_BIT_C          : integer := 3;
  constant CRRESP_WAS_UNIQUE_BIT_C         : integer := 4;

  -----------------------------------------------------------------------------
  -- Full ACE address write(AW) interface
  -----------------------------------------------------------------------------
  type ace_lite_aw_m2s_t is record
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);

    awqos    : std_logic_vector(3 downto 0);
    awregion : std_logic_vector(3 downto 0);
    awuser   : std_logic_vector;

    awdomain : std_logic_vector(1 downto 0); -- ACE Only
    awsnoop  : std_logic_vector(2 downto 0); -- ACE Only
    awbar    : std_logic_vector(2 downto 0); -- ACE Only
    awunique : std_logic;                    -- ACE rev E only 

    awvalid : std_logic;
  end record;

  type ace_lite_aw_s2m_t is record
    awready : std_logic;
  end record;

  type ace_lite_aw_t is record
    m2s : ace_lite_aw_m2s_t;
    s2m : ace_lite_aw_s2m_t;
  end record;

  type ace_lite_aw_io_t is record
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;

    awqos    : std_logic_vector(3 downto 0);
    awregion : std_logic_vector(3 downto 0);
    awuser   : std_logic_vector;

    awdomain : std_logic_vector(1 downto 0); -- ACE Only
    awsnoop  : std_logic_vector(2 downto 0); -- ACE Only
    awbar    : std_logic_vector(2 downto 0); -- ACE Only
    awunique : std_logic;                    -- ACE rev E only 

    awready : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE write data(W) interface
  -----------------------------------------------------------------------------
  type ace_lite_w_m2s_t is record
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    wuser   : std_logic_vector;

    wvalid  : std_logic;
  end record;

  type ace_lite_w_s2m_t is record
    wready  : std_logic;
  end record;

  type ace_lite_w_t is record
    m2s : ace_lite_w_m2s_t;
    s2m : ace_lite_w_s2m_t;
  end record;

  type ace_lite_w_io_t is record
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    wuser   : std_logic_vector;

    wvalid  : std_logic;
    wready  : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE write response(B) interface
  -----------------------------------------------------------------------------
  type ace_lite_b_m2s_t is record
    bready : std_logic;
    -- wack   : std_logic; -- ACE only (not in lite)
  end record;

  type ace_lite_b_s2m_t is record
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;
  end record;

  type ace_lite_b_t is record
    m2s : ace_lite_b_m2s_t;
    s2m : ace_lite_b_s2m_t;
  end record;

  type ace_lite_b_io_t is record
    bready : std_logic;
    -- wack   : std_logic; -- ACE only (not in lite)
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE address read(AR) interface
  -----------------------------------------------------------------------------
  type ace_lite_ar_m2s_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    arqos    : std_logic_vector(3 downto 0);
    arregion : std_logic_vector(3 downto 0);
    aruser   : std_logic_vector;

    ardomain : std_logic_vector(1 downto 0);
    arsnoop  : std_logic_vector(3 downto 0);
    arbar    : std_logic_vector(1 downto 0);

    arvalid : std_logic;
  end record;

  type ace_lite_ar_s2m_t is record
    arready : std_logic;
  end record;

  type ace_lite_ar_t is record
    m2s : ace_lite_ar_m2s_t;
    s2m : ace_lite_ar_s2m_t;
  end record;

  type ace_lite_ar_io_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    arqos    : std_logic_vector(3 downto 0);
    arregion : std_logic_vector(3 downto 0);
    aruser   : std_logic_vector;

    ardomain : std_logic_vector(1 downto 0);
    arsnoop  : std_logic_vector(3 downto 0);
    arbar    : std_logic_vector(1 downto 0);

    arvalid : std_logic;
    arready : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE read data(R) interface
  -----------------------------------------------------------------------------
  type ace_lite_r_m2s_t is record
    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0); -- ACE only - two additional bits (not in lite)
    rlast   : std_logic;

    ruser   : std_logic_vector;

    rvalid  : std_logic;
  end record;

  type ace_lite_r_s2m_t is record
    rready  : std_logic;
  end record;

  type ace_lite_r_t is record
    m2s : ace_lite_r_m2s_t;
    s2m : ace_lite_r_s2m_t;
  end record;

  type ace_lite_r_io_t is record
    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0); -- ACE only - two additional bits (not in lite)
    rlast   : std_logic;

    ruser   : std_logic_vector;

    rvalid  : std_logic;
    rready  : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE interface
  -----------------------------------------------------------------------------
  type ace_lite_rd_t is record
    ar: ace_lite_ar_t;
    r:  ace_lite_r_t;
  end record;

  type ace_lite_wr_t is record
    aw: ace_lite_aw_t;
    w:  ace_lite_w_t;
    b:  ace_lite_b_t;
  end record;

  type ace_lite_t is record
    aw: ace_lite_aw_t;
    w:  ace_lite_w_t;
    b:  ace_lite_b_t;

    ar: ace_lite_ar_t;
    r:  ace_lite_r_t;
  end record;

  type ace_lite_rd_m2s_t is record
    ar: ace_lite_ar_m2s_t;
    r:  ace_lite_r_m2s_t;
  end record;

  type ace_lite_rd_s2m_t is record
    ar: ace_lite_ar_s2m_t;
    r:  ace_lite_r_s2m_t;
  end record;

  type ace_lite_wr_m2s_t is record
    aw: ace_lite_aw_m2s_t;
    w:  ace_lite_w_m2s_t;
    b:  ace_lite_b_m2s_t;
  end record;

  type ace_lite_wr_s2m_t is record
    aw: ace_lite_aw_s2m_t;
    w:  ace_lite_w_s2m_t;
    b:  ace_lite_b_s2m_t;
  end record;

  type ace_lite_m2s_t is record
    aw: ace_lite_aw_m2s_t;
    w:  ace_lite_w_m2s_t;
    b:  ace_lite_b_m2s_t;

    ar: ace_lite_ar_m2s_t;
    r:  ace_lite_r_m2s_t;
  end record;

  type ace_lite_s2m_t is record
    aw: ace_lite_aw_s2m_t;
    w:  ace_lite_w_s2m_t;
    b:  ace_lite_b_s2m_t;

    ar: ace_lite_ar_s2m_t;
    r:  ace_lite_r_s2m_t;
  end record;

  type ace_lite_rd_io_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    arqos    : std_logic_vector(3 downto 0);
    arregion : std_logic_vector(3 downto 0);
    aruser   : std_logic_vector;

    ardomain : std_logic_vector(1 downto 0);
    arsnoop  : std_logic_vector(3 downto 0);
    arbar    : std_logic_vector(1 downto 0);

    arvalid : std_logic;
    arready : std_logic;

    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;

    ruser   : std_logic_vector;

    rvalid  : std_logic;
    rready  : std_logic;
  end record;

  type ace_lite_wr_io_t is record
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;

    awqos    : std_logic_vector(3 downto 0);
    awregion : std_logic_vector(3 downto 0);
    awuser   : std_logic_vector;

    awdomain : std_logic_vector(1 downto 0); -- ACE Only
    awsnoop  : std_logic_vector(2 downto 0); -- ACE Only
    awbar    : std_logic_vector(2 downto 0); -- ACE Only
    awunique : std_logic;                    -- ACE rev E only 

    awready : std_logic;
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    wuser   : std_logic_vector;

    wvalid  : std_logic;
    wready  : std_logic;

    bready : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;
  end record;

  type ace_lite_io_t is record
    -- Read
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    arqos    : std_logic_vector(3 downto 0);
    arregion : std_logic_vector(3 downto 0);
    aruser   : std_logic_vector;

    ardomain : std_logic_vector(1 downto 0);
    arsnoop  : std_logic_vector(3 downto 0);
    arbar    : std_logic_vector(1 downto 0);

    arvalid : std_logic;
    arready : std_logic;

    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;

    ruser   : std_logic_vector;

    rvalid  : std_logic;
    rready  : std_logic;

    -- Write
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;

    awqos    : std_logic_vector(3 downto 0);
    awregion : std_logic_vector(3 downto 0);
    awuser   : std_logic_vector;

    awdomain : std_logic_vector(1 downto 0); -- ACE Only
    awsnoop  : std_logic_vector(2 downto 0); -- ACE Only
    awbar    : std_logic_vector(2 downto 0); -- ACE Only
    awunique : std_logic;                    -- ACE rev E only 

    awready : std_logic;
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    wuser   : std_logic_vector;

    wvalid  : std_logic;
    wready  : std_logic;

    bready : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;
  end record;
end package;

package body ace_lite_rev_e_pkg is
end package body ace_lite_rev_e_pkg;
