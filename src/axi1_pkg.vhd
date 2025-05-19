-- AMBA AXI Protocol v1.0
-- Pulled from document "ARM IHI 0022B"
-- March 19, 2004

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

package axi1_pkg is
  constant ADDR_WIDTH_C   : integer := 32;
  constant DATA_WIDTH_C   : integer := 32;
  constant ID_WIDTH_C     : integer := 4;
  constant BURST_LENGTH_C : integer := 4;

  -----------------------------------------------------------------------------
  -- Full AXI1 address write(AW) interface
  -----------------------------------------------------------------------------
  type axi1_aw_m2s_t is record
    awid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    awaddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;
  end record;

  type axi1_aw_s2m_t is record
    awready : std_logic;
  end record;

  type axi1_aw_t is record
    m2s : axi1_aw_m2s_t;
    s2m : axi1_aw_s2m_t;
  end record;

  type axi1_aw_io_t is record
    awid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    awaddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;
    awready : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI1 write data(W) interface
  -----------------------------------------------------------------------------
  type axi1_m2s_w_t is record
    wid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    wdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    wstrb   : std_logic_vector((DATA_WIDTH_C/8)-1 downto 0);
    wlast   : std_logic;
    wvalid  : std_logic;
  end record;

  type axi1_w_s2m_t is record
    wready  : std_logic;
  end record;

  type axi1_w_t is record
    m2s : axi1_w_m2s_t;
    s2m : axi1_w_s2m_t;
  end record;

  type axi1_w_io_t is record
    wid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    wdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    wstrb   : std_logic_vector((DATA_WIDTH_C/8)-1 downto 0);
    wlast   : std_logic;
    wvalid  : std_logic;
    wready  : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI1 write response(B) interface
  -----------------------------------------------------------------------------
  type axi1_b_m2s_t is record
    bready : std_logic;
  end record;

  type axi1_b_s2m_t is record
    bid    : std_logic_vector(ID_WIDTH_C-1 downto 0);
    bresp  : std_logic_vector(1 downto 0);
    bvalid : std_logic;
  end record;

  type axi1_b_t is record
    m2s : axi1_b_m2s_t;
    s2m : axi1_b_s2m_t;
  end record;

  type axi1_b_io_t is record
    bready : std_logic;
    bid    : std_logic_vector(ID_WIDTH_C-1 downto 0);
    bresp  : std_logic_vector(1 downto 0);
    bvalid : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI1 address read(AR) interface
  -----------------------------------------------------------------------------
  type axi1_ar_m2s_t is record
    arid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    araddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);
    arvalid : std_logic;
  end record;

  type axi1_ar_s2m_t is record
    arready : std_logic;
  end record;

  type axi1_ar_t is record
    m2s : axi1_ar_m2s_t;
    s2m : axi1_ar_s2m_t;
  end record;

  type axi1_ar_io_t is record
    arid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    araddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);
    arvalid : std_logic;
    arready : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI1 read data(R) interface
  -----------------------------------------------------------------------------
  type axi1_r_m2s_t is record
    rid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    rdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;
    rvalid  : std_logic;
  end record;

  type axi1_r_s2m_t is record
    rready  : std_logic;
  end record;

  type axi1_r_t is record
    m2s : axi1_r_m2s_t;
    s2m : axi1_r_s2m_t;
  end record;

  type axi1_r_io_t is record
    rid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    rdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;
    rvalid  : std_logic;
    rready  : std_logic;
  end record;



  -----------------------------------------------------------------------------
  -- Full AXI1 interface
  -----------------------------------------------------------------------------
  type axi1_rd_t is record
    ar: axi1_r_t;
    r: axi1_r_t;
  end record;

  type axi1_wr_t is record
    aw: axi1_aw_t;
    w:  axi1_w_t;
    b:  axi1_b_t;
  end record;

  type axi1_t is record
    aw: axi1_aw_t;
    w:  axi1_w_t;
    b:  axi1_b_t;

    ar: axi1_r_t;
    r: axi1_r_t;
  end record;


  type axi1_rd_io_t is record
    arid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    araddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);
    arvalid : std_logic;
    arready : std_logic;

    rid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    rdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;
    rvalid  : std_logic;
    rready  : std_logic;
  end record;

  type axi1_wr_io_t is record
    awid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    awaddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;
    awready : std_logic;

    wid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    wdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    wstrb   : std_logic_vector((DATA_WIDTH_C/8)-1 downto 0);
    wlast   : std_logic;
    wvalid  : std_logic;
    wready  : std_logic;

    bready : std_logic;
    bid    : std_logic_vector(ID_WIDTH_C-1 downto 0);
    bresp  : std_logic_vector(1 downto 0);
    bvalid : std_logic;
  end record;

  type axi1_io_t is record
    arid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    araddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    arlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    arsize  : std_logic_vector(2 downto 0);  -- data size per beat
    arburst : std_logic_vector(1 downto 0);  -- burst type
    arlock  : std_logic_vector(1 downto 0);
    arcache : std_logic_vector(3 downto 0);
    arprot  : std_logic_vector(2 downto 0);
    arvalid : std_logic;
    arready : std_logic;

    rid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    rdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    rresp   : std_logic_vector(1 downto 0);
    rlast   : std_logic;
    rvalid  : std_logic;
    rready  : std_logic;

    awid    : std_logic_vector(ID_WIDTH_C-1     downto 0);
    awaddr  : std_logic_vector(ADDR_WIDTH_C-1   downto 0);
    awlen   : std_logic_vector(BURST_LENGTH_C-1 downto 0);  -- burst length in beats
    awsize  : std_logic_vector(2 downto 0);  -- data size per beat
    awburst : std_logic_vector(1 downto 0);  -- burst type
    awlock  : std_logic_vector(1 downto 0);
    awcache : std_logic_vector(3 downto 0);
    awprot  : std_logic_vector(2 downto 0);
    awvalid : std_logic;
    awready : std_logic;

    wid     : std_logic_vector(      ID_WIDTH_C-1 downto 0);
    wdata   : std_logic_vector(    DATA_WIDTH_C-1 downto 0);
    wstrb   : std_logic_vector((DATA_WIDTH_C/8)-1 downto 0);
    wlast   : std_logic;
    wvalid  : std_logic;
    wready  : std_logic;

    bready : std_logic;
    bid    : std_logic_vector(ID_WIDTH_C-1 downto 0);
    bresp  : std_logic_vector(1 downto 0);
    bvalid : std_logic;
  end record;
end package;

package body axi1_pkg is
end package body axi1_pkg;
