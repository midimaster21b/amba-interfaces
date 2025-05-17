-- AMBA AXI4-Lite Protocol
-- Pulled from document "ARM IHI 0022D" (ID110411)
-- October 28, 2011
--
-- Naming schemes
-- axi_aw_m2s_t - directional AW signals
-- axi_aw_io_t  - bidirectional AW signals
-- axi_aw_t     - hierarchical AW signals
-- axi_rd_io_t  - bidirectional read channels signals
-- axi_rd_t     - directional hierarchical read channels signals
-- axi_t        - hierarchical with all channels signals

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axi4_lite_pkg is
  -----------------------------------------------------------------------------
  -- Full AXI4-Lite address write(AW) interface
  -----------------------------------------------------------------------------
  type axi4_lite_aw_m2s_t is record
    -- Write address channel
    awvalid  : std_logic;
    awaddr   : std_logic_vector;
    awprot   : std_logic_vector(2 downto 0);
  end record;

  type axi4_lite_aw_s2m_t is record
    awready  : std_logic;
  end record;

  type axi4_lite_aw_t is record
    m2s: axi4_lite_aw_m2s_t;
    s2m: axi4_lite_aw_s2m_t;
  end record;

  type axi4_lite_aw_io_t is record
    -- Write address channel
    awvalid  : std_logic;
    awready  : std_logic;
    awaddr   : std_logic_vector;
    awprot   : std_logic_vector(2 downto 0);
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI4-Lite write(W) interface
  -----------------------------------------------------------------------------
  type axi4_lite_w_m2s_t is record
    wvalid   : std_logic;
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
  end record;

  type axi4_lite_w_s2m_t is record
    wready   : std_logic;
  end record;

  type axi4_lite_w_t is record
    m2s: axi4_lite_w_m2s_t;
    s2m: axi4_lite_w_s2m_t;
  end record;

  type axi4_lite_w_io_t is record
    wvalid   : std_logic;
    wready   : std_logic;
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI4-Lite write response(B) interface
  -----------------------------------------------------------------------------
  type axi4_lite_b_m2s_t is record
    bready   : std_logic;
  end record;

  type axi4_lite_b_s2m_t is record
    bvalid   : std_logic;
    bresp    : std_logic_vector(1 downto 0);
  end record;

  type axi4_lite_b_t is record
    m2s: axi4_lite_b_m2s_t;
    s2m: axi4_lite_b_s2m_t;
  end record;

  type axi4_lite_b_io_t is record
    bvalid   : std_logic;
    bready   : std_logic;
    bresp    : std_logic_vector(1 downto 0);
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI4-Lite read address(AR) interface
  -----------------------------------------------------------------------------
  type axi4_lite_ar_m2s_t is record
    arvalid  : std_logic;
    araddr   : std_logic_vector;
    arprot   : std_logic_vector(2 downto 0);
  end record;

  type axi4_lite_ar_s2m_t is record
    arready  : std_logic;
  end record;

  type axi4_lite_ar_t is record
    m2s: axi4_lite_ar_m2s_t;
    s2m: axi4_lite_ar_s2m_t;
  end record;

  type axi4_lite_ar_io_t is record
    arvalid  : std_logic;
    arready  : std_logic;
    araddr   : std_logic_vector;
    arprot   : std_logic_vector(2 downto 0);
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI4-Lite read data(AR) interface
  -----------------------------------------------------------------------------
  type axi4_lite_r_m2s_t is record
    rready   : std_logic;
  end record;

  type axi4_lite_r_s2m_t is record
    rvalid   : std_logic;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
  end record;

  type axi4_lite_r_t is record
    m2s: axi4_lite_r_m2s_t;
    s2m: axi4_lite_r_s2m_t;
  end record;

  type axi4_lite_r_io_t is record
    rvalid   : std_logic;
    rready   : std_logic;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI4-Lite interfaces
  -----------------------------------------------------------------------------
  type axi4_lite_rd_t is record
    ar: axi4_lite_ar_t;
    r:  axi4_lite_r_t;
  end record;

  type axi4_lite_wr_t is record
    aw: axi4_lite_aw_t;
    w:  axi4_lite_w_t;
    b:  axi4_lite_b_t;
  end record;

  type axi4_lite_t is record
    aw: axi4_lite_aw_t;
    w:  axi4_lite_w_t;
    b:  axi4_lite_b_t;

    ar: axi4_lite_ar_t;
    r:  axi4_lite_r_t;
  end record;

  type axi4_lite_rd_m2s_t is record
    ar: axi4_lite_ar_m2s_t;
    r:  axi4_lite_r_m2s_t;
  end record;

  type axi4_lite_rd_s2m_t is record
    ar: axi4_lite_ar_s2m_t;
    r:  axi4_lite_r_s2m_t;
  end record;

  type axi4_lite_wr_m2s_t is record
    aw: axi4_lite_aw_m2s_t;
    w:  axi4_lite_w_m2s_t;
    b:  axi4_lite_b_m2s_t;
  end record;

  type axi4_lite_wr_s2m_t is record
    aw: axi4_lite_aw_s2m_t;
    w:  axi4_lite_w_s2m_t;
    b:  axi4_lite_b_s2m_t;
  end record;

  type axi4_lite_m2s_t is record
    aw: axi4_lite_aw_m2s_t;
    w:  axi4_lite_w_m2s_t;
    b:  axi4_lite_b_m2s_t;

    ar: axi4_lite_ar_m2s_t;
    r:  axi4_lite_r_m2s_t;
  end record;

  type axi4_lite_s2m_t is record
    aw: axi4_lite_aw_s2m_t;
    w:  axi4_lite_w_s2m_t;
    b:  axi4_lite_b_s2m_t;

    ar: axi4_lite_ar_s2m_t;
    r:  axi4_lite_r_s2m_t;
  end record;

  type axi4_lite_io_t is record
    -- Write address channel
    awvalid  : std_logic;
    awready  : std_logic;
    awaddr   : std_logic_vector;
    awprot   : std_logic_vector(2 downto 0);

    -- Write data channel
    wvalid   : std_logic;
    wready   : std_logic;
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;

    -- Write response channel
    bvalid   : std_logic;
    bready   : std_logic;
    bresp    : std_logic_vector(1 downto 0);

    -- Read address channel
    arvalid  : std_logic;
    arready  : std_logic;
    araddr   : std_logic_vector;
    arprot   : std_logic_vector(2 downto 0);

    -- Read data channel
    rvalid   : std_logic;
    rready   : std_logic;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
  end record axi4_lite_t;

end package;

package body axi4_lite_pkg is
end package body axi4_lite_pkg;
