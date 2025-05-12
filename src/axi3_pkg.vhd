-- AMBA AXI3 Protocol
-- Pulled from document "ARM IHI 0022D" (ID110411)
-- October 28, 2011

-- Naming schemes
-- axi1_aw_m2s_t - directional AW signals
-- axi1_aw_io_t  - bidirectional AW signals
-- axi1_aw_t     - hierarchical AW signals
-- axi1_rd_io_t  - bidirectional read channels signals
-- axi1_rd_t     - directional hierarchical read channels signals
-- axi1_t        - hierarchical with all channels signals

-- Global signals not included in these records:
-- CSYSREQ - System low-power request (from clock controller)
-- CSYSACK - Low-power request acknowledgement (from peripheral device)
-- CACTIVE - Clock active (from peripheral device)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axi3_pkg is
  constant BURST_LENGTH_C : integer := 4;

  -----------------------------------------------------------------------------
  -- Full AXI3 address write(AW) interface
  -----------------------------------------------------------------------------
  type axi3_aw_m2s_t is record
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);

    -- awqos    : std_logic_vector; -- AXI4 Only
    -- awregion : std_logic_vector; -- AXI4 Only
    -- awuser   : std_logic_vector; -- AXI4 Only

   awvalid : std_logic;
  end record;

  type axi3_aw_s2m_t is record
    awready : std_logic;
  end record;

  type axi3_aw_t is record
    m2s : axi3_aw_m2s_t;
    s2m : axi3_aw_s2m_t;
  end record;

  type axi3_aw_io_t is record
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;

    -- awqos    : std_logic_vector; -- AXI4 Only
    -- awregion : std_logic_vector; -- AXI4 Only
    -- awuser   : std_logic_vector; -- AXI4 Only

    awready : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI3 write data(W) interface
  -----------------------------------------------------------------------------
  type axi3_m2s_w_t is record
    wid     : std_logic_vector; -- AXI3 only
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    -- wuser   : std_logic_vector; -- AXI4 Only

    wvalid  : std_logic;
  end record;

  type axi3_w_m2s_t is record
    wready  : std_logic;
  end record;

  type axi3_w_t is record
    m2s : axi3_w_m2s_t;
    s2m : axi3_w_s2m_t;
  end record;

  type axi3_w_io_t is record
    wid     : std_logic_vector; -- AXI3 only
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    -- wuser   : std_logic_vector; -- AXI4 Only

    wvalid  : std_logic;
    wready  : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI3 write response(B) interface
  -----------------------------------------------------------------------------
  type axi3_b_m2s_t is record
    bready : std_logic;
  end record;

  type axi3_b_m2s_t is record
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    -- buser  : std_logic_vector; -- AXI4 only
    bvalid : std_logic;
  end record;

  type axi3_b_t is record
    m2s : axi3_b_m2s_t;
    s2m : axi3_b_s2m_t;
  end record;

  type axi3_b_io_t is record
    bready : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    -- buser  : std_logic_vector; -- AXI4 only
    bvalid : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI3 address read(AR) interface
  -----------------------------------------------------------------------------
  type axi3_ar_m2s_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    -- arqos    : std_logic_vector; -- AXI4 only
    -- arregion : std_logic_vector; -- AXI4 only
    -- aruser   : std_logic_vector; -- AXI4 only

    arvalid : std_logic;
  end record;

  type axi3_ar_s2m_t is record
    arready : std_logic;
  end record;

  type axi3_ar_t is record
    m2s : axi3_ar_m2s_t;
    s2m : axi3_ar_s2m_t;
  end record;

  type axi3_ar_io_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    -- arqos    : std_logic_vector; -- AXI4 only
    -- arregion : std_logic_vector; -- AXI4 only
    -- aruser   : std_logic_vector; -- AXI4 only

    arvalid : std_logic;
    arready : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI3 read data(R) interface
  -----------------------------------------------------------------------------
  type axi3_r_m2s_t is record
    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;

    -- ruser   : std_logic_vector;

    rvalid  : std_logic;
  end record;

  type axi3_r_m2s_t is record
    rready  : std_logic;
  end record;

  type axi3_r_t is record
    m2s : axi3_r_m2s_t;
    s2m : axi3_r_s2m_t;
  end record;

  type axi3_r_io_t is record
    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;

    -- ruser   : std_logic_vector;

    rvalid  : std_logic;
    rready  : std_logic;
  end record;



  -----------------------------------------------------------------------------
  -- Full AXI3 interface
  -----------------------------------------------------------------------------
  type axi3_rd_t is record
    ar: axi3_ar_t;
    r:  axi3_r_t;
  end record;

  type axi3_wr_t is record
    aw: axi3_aw_t;
    w:  axi3_w_t;
    b:  axi3_b_t;
  end record;

  type axi3_t is record
    aw: axi3_aw_t;
    w:  axi3_w_t;
    b:  axi3_b_t;

    ar: axi3_ar_t;
    r:  axi3_r_t;
  end record;

  type axi3_rd_m2s_t is record
    ar: axi3_ar_m2s_t;
    r:  axi3_r_m2s_t;
  end record;

  type axi3_rd_s2m_t is record
    ar: axi3_ar_s2m_t;
    r:  axi3_r_s2m_t;
  end record;

  type axi3_wr_m2s_t is record
    aw: axi3_aw_m2s_t;
    w:  axi3_w_m2s_t;
    b:  axi3_b_m2s_t;
  end record;

  type axi3_wr_s2m_t is record
    aw: axi3_aw_s2m_t;
    w:  axi3_w_s2m_t;
    b:  axi3_b_s2m_t;
  end record;

  type axi3_m2s_t is record
    aw: axi3_aw_m2s_t;
    w:  axi3_w_m2s_t;
    b:  axi3_b_m2s_t;

    ar: axi3_ar_m2s_t;
    r:  axi3_r_m2s_t;
  end record;

  type axi3_s2m_t is record
    aw: axi3_aw_s2m_t;
    w:  axi3_w_s2m_t;
    b:  axi3_b_s2m_t;

    ar: axi3_ar_s2m_t;
    r:  axi3_r_s2m_t;
  end record;

  type axi3_rd_io_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    -- arqos    : std_logic_vector; -- AXI4 only
    -- arregion : std_logic_vector; -- AXI4 only
    -- aruser   : std_logic_vector; -- AXI4 only

    arvalid : std_logic;
    arready : std_logic;

    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;

    -- ruser   : std_logic_vector; -- AXI4 only

    rvalid  : std_logic;
    rready  : std_logic;
  end record;

  type axi3_wr_io_t is record
    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;

    -- awqos    : std_logic_vector; -- AXI4 Only
    -- awregion : std_logic_vector; -- AXI4 Only
    -- awuser   : std_logic_vector; -- AXI4 Only

    awready : std_logic;

    wid     : std_logic_vector; -- AXI3 only
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    -- wuser   : std_logic_vector; -- AXI4 Only

    wvalid  : std_logic;
    wready  : std_logic;

    bready : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    -- buser  : std_logic_vector; -- AXI4 only
    bvalid : std_logic;
  end record;

  type axi3_io_t is record
    arid    : std_logic_vector;
    araddr  : std_logic_vector;
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);

    -- arqos    : std_logic_vector; -- AXI4 only
    -- arregion : std_logic_vector; -- AXI4 only
    -- aruser   : std_logic_vector; -- AXI4 only

    arvalid : std_logic;
    arready : std_logic;

    rid     : std_logic_vector;
    rdata   : std_logic_vector;
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;

    -- ruser   : std_logic_vector; -- AXI4 only

    rvalid  : std_logic;
    rready  : std_logic;

    awid    : std_logic_vector;
    awaddr  : std_logic_vector;
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;

    -- awqos    : std_logic_vector; -- AXI4 Only
    -- awregion : std_logic_vector; -- AXI4 Only
    -- awuser   : std_logic_vector; -- AXI4 Only

    awready : std_logic;

    wid     : std_logic_vector; -- AXI3 only
    wdata   : std_logic_vector;
    wstrb   : std_logic_vector;
    wlast   : std_logic;

    -- wuser   : std_logic_vector; -- AXI4 Only

    wvalid  : std_logic;
    wready  : std_logic;

    bready : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    -- buser  : std_logic_vector; -- AXI4 only
    bvalid : std_logic;
  end record;
end package;

package body axi3_pkg is
end package body axi3_pkg;
