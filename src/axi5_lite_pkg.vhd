-- AMBA AXI5-Lite Protocol
-- Pulled from document "ARM IHI 0022F.b" (ID122117)
-- December 21, 2017
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

package axi5_lite_pkg is
  -----------------------------------------------------------------------------
  -- Full AXI5-Lite address write(AW) interface
  -----------------------------------------------------------------------------
  type axi5_lite_aw_m2s_t is record
    awid        : std_logic_vector;
    awaddr      : std_logic_vector;
    awsize      : std_logic_vector(2 downto 0);
    awprot      : std_logic_vector(2 downto 0);
    awuser      : std_logic_vector;
    awvalid     : std_logic;
  end record;

  type axi5_lite_aw_s2m_t is record
    awready  : std_logic;
  end record;

  type axi5_lite_aw_t is record
    m2s: axi5_lite_aw_m2s_t;
    s2m: axi5_lite_aw_s2m_t;
  end record;

  type axi5_lite_aw_io_t is record
    awid        : std_logic_vector;
    awaddr      : std_logic_vector;
    awsize      : std_logic_vector(2 downto 0);
    awprot      : std_logic_vector(2 downto 0);
    awuser      : std_logic_vector;
    awvalid     : std_logic;

    awready     : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5-Lite write(W) interface
  -----------------------------------------------------------------------------
  type axi5_lite_w_m2s_t is record
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wuser    : std_logic_vector;
    wvalid   : std_logic;

    wdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    wpoison  : std_logic_vector; -- AXI5-only property: Poison
    wtrace   : std_logic;        -- AXI5-only property: Trace_signals
  end record;

  type axi5_lite_w_s2m_t is record
    wready : std_logic;
  end record;

  type axi5_lite_w_t is record
    m2s: axi5_lite_w_m2s_t;
    s2m: axi5_lite_w_s2m_t;
  end record;

  type axi5_lite_w_io_t is record
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wuser    : std_logic_vector;
    wvalid   : std_logic;

    wdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    wpoison  : std_logic_vector; -- AXI5-only property: Poison
    wtrace   : std_logic;        -- AXI5-only property: Trace_signals

    wready   : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5-Lite write response(B) interface
  -----------------------------------------------------------------------------
  type axi5_lite_b_m2s_t is record
    bready : std_logic;
  end record;

  type axi5_lite_b_s2m_t is record
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
  end record;

  type axi5_lite_b_t is record
    m2s: axi5_lite_b_m2s_t;
    s2m: axi5_lite_b_s2m_t;
  end record;

  type axi5_lite_b_io_t is record
    bready : std_logic;

    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5-Lite read address(AR) interface
  -----------------------------------------------------------------------------
  type axi5_lite_ar_m2s_t is record
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arsize      : std_logic_vector(2 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    aruser      : std_logic_vector;
    arvalid     : std_logic;

    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
  end record;

  type axi5_lite_ar_s2m_t is record
    arready     : std_logic;
  end record;

  type axi5_lite_ar_t is record
    m2s: axi5_lite_ar_m2s_t;
    s2m: axi5_lite_ar_s2m_t;
  end record;

  type axi5_lite_ar_io_t is record
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arsize      : std_logic_vector(2 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    aruser      : std_logic_vector;
    arvalid     : std_logic;

    artrace     : std_logic;        -- AXI5-only property: Trace_Signals

    arready     : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5-Lite read data(R) interface
  -----------------------------------------------------------------------------
  type axi5_lite_r_m2s_t is record
    rready : std_logic;
  end record;

  type axi5_lite_r_s2m_t is record
    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
    ruser    : std_logic_vector;
    rvalid   : std_logic;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
  end record;

  type axi5_lite_r_t is record
    m2s: axi5_lite_r_m2s_t;
    s2m: axi5_lite_r_s2m_t;
  end record;

  type axi5_lite_r_io_t is record
    rready   : std_logic;

    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
    ruser    : std_logic_vector;
    rvalid   : std_logic;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5-Lite optional (OPT) interface
  -----------------------------------------------------------------------------
  type axi5_lite_opt_m2s_t is record
    awakeup         : std_logic;                    -- AXI5-only property: Wakeup_Signals
  end record;

  type axi5_lite_opt_s2m_t is record
  end record;

  type axi5_lite_opt_t is record
    m2s: axi5_lite_opt_m2s_t;
    s2m: axi5_lite_opt_s2m_t;
  end record;

  type axi5_lite_opt_io_t is record
    awakeup         : std_logic;                    -- AXI5-only property: Wakeup_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5-Lite interfaces
  -----------------------------------------------------------------------------
  type axi5_lite_rd_t is record
    ar: axi5_lite_ar_t;
    r:  axi5_lite_r_t;
  end record;

  type axi5_lite_wr_t is record
    aw: axi5_lite_aw_t;
    w:  axi5_lite_w_t;
    b:  axi5_lite_b_t;
  end record;

  type axi5_lite_t is record
    aw: axi5_lite_aw_t;
    w:  axi5_lite_w_t;
    b:  axi5_lite_b_t;

    ar: axi5_lite_ar_t;
    r:  axi5_lite_r_t;
  end record;

  type axi5_lite_rd_m2s_t is record
    ar: axi5_lite_ar_m2s_t;
    r:  axi5_lite_r_m2s_t;
  end record;

  type axi5_lite_rd_s2m_t is record
    ar: axi5_lite_ar_s2m_t;
    r:  axi5_lite_r_s2m_t;
  end record;

  type axi5_lite_wr_m2s_t is record
    aw: axi5_lite_aw_m2s_t;
    w:  axi5_lite_w_m2s_t;
    b:  axi5_lite_b_m2s_t;
  end record;

  type axi5_lite_wr_s2m_t is record
    aw: axi5_lite_aw_s2m_t;
    w:  axi5_lite_w_s2m_t;
    b:  axi5_lite_b_s2m_t;
  end record;

  type axi5_lite_m2s_t is record
    aw: axi5_lite_aw_m2s_t;
    w:  axi5_lite_w_m2s_t;
    b:  axi5_lite_b_m2s_t;

    ar: axi5_lite_ar_m2s_t;
    r:  axi5_lite_r_m2s_t;
  end record;

  type axi5_lite_s2m_t is record
    aw: axi5_lite_aw_s2m_t;
    w:  axi5_lite_w_s2m_t;
    b:  axi5_lite_b_s2m_t;

    ar: axi5_lite_ar_s2m_t;
    r:  axi5_lite_r_s2m_t;
  end record;

  type axi5_lite_io_t is record
    ------------------------------
    -- Write Address channel
    ------------------------------
    awid        : std_logic_vector;
    awaddr      : std_logic_vector;
    awsize      : std_logic_vector(2 downto 0);
    awprot      : std_logic_vector(2 downto 0);
    awuser      : std_logic_vector;
    awvalid     : std_logic;

    awready     : std_logic;

    ------------------------------
    -- Write Data channel
    ------------------------------
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wuser    : std_logic_vector;
    wvalid   : std_logic;

    wdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    wpoison  : std_logic_vector; -- AXI5-only property: Poison
    wtrace   : std_logic;        -- AXI5-only property: Trace_signals

    wready   : std_logic;

    ------------------------------
    -- Write Response channel
    ------------------------------
    bready : std_logic;

    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals

    ------------------------------
    -- Read Address channel
    ------------------------------
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arsize      : std_logic_vector(2 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    aruser      : std_logic_vector;
    arvalid     : std_logic;

    artrace     : std_logic;        -- AXI5-only property: Trace_Signals

    arready     : std_logic;

    ------------------------------
    -- Read channel
    ------------------------------
    rready   : std_logic;

    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
    ruser    : std_logic_vector;
    rvalid   : std_logic;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals

    ------------------------------
    -- Optional Channel
    ------------------------------
    awakeup         : std_logic; -- AXI5-only property: Wakeup_Signals
  end record axi5_lite_t;

end package;

package body axi5_lite_pkg is
end package body axi5_lite_pkg;
