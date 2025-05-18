-- AMBA AXI5 Protocol
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

package axi5_pkg is
  -----------------------------------------------------------------------------
  -- Full AXI5 address write(AW) interface
  -----------------------------------------------------------------------------
  type axi5_aw_m2s_t is record
    awid        : std_logic_vector;
    awaddr      : std_logic_vector;
    awlen       : std_logic_vector(7 downto 0);
    awsize      : std_logic_vector(2 downto 0);
    awburst     : std_logic_vector(1 downto 0);
    awlock      : std_logic;
    awcache     : std_logic_vector(3 downto 0);
    awprot      : std_logic_vector(2 downto 0);
    awqos       : std_logic_vector(3 downto 0);
    awregion    : std_logic_vector(3 downto 0);
    awuser      : std_logic_vector;
    awvalid     : std_logic;

    awatop      : std_logic_vector(5 downto 0); -- AXI5-only property: Atomic_Transactions
    awtrace     : std_logic;                    -- AXI5-only property: Trace_Signals
    awloop      : std_logic_vector;             -- AXI5-only property: Loopback_Signals

    awmmusecsid : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmusid    : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmussidv  : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmussid   : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmuatst   : std_logic;                    -- AXI5-only property: Untranslated_Transactions

    awnsaid     : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers
  end record;

  type axi5_aw_s2m_t is record
    awready  : std_logic;
  end record;

  type axi5_aw_t is record
    m2s: axi5_aw_m2s_t;
    s2m: axi5_aw_s2m_t;
  end record;

  type axi5_aw_io_t is record
    awid        : std_logic_vector;
    awaddr      : std_logic_vector;
    awlen       : std_logic_vector(7 downto 0);
    awsize      : std_logic_vector(2 downto 0);
    awburst     : std_logic_vector(1 downto 0);
    awlock      : std_logic;
    awcache     : std_logic_vector(3 downto 0);
    awprot      : std_logic_vector(2 downto 0);
    awqos       : std_logic_vector(3 downto 0);
    awregion    : std_logic_vector(3 downto 0);
    awuser      : std_logic_vector;
    awvalid     : std_logic;

    awatop      : std_logic_vector(5 downto 0); -- AXI5-only property: Atomic_Transactions
    awtrace     : std_logic;                    -- AXI5-only property: Trace_Signals
    awloop      : std_logic_vector;             -- AXI5-only property: Loopback_Signals

    awmmusecsid : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmusid    : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmussidv  : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmussid   : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmuatst   : std_logic;                    -- AXI5-only property: Untranslated_Transactions

    awnsaid     : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers

    awready     : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5 write(W) interface
  -----------------------------------------------------------------------------
  type axi5_w_m2s_t is record
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wlast    : std_logic;
    wuser    : std_logic_vector;
    wvalid   : std_logic;

    wdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    wpoison  : std_logic_vector; -- AXI5-only property: Poison
    wtrace   : std_logic;        -- AXI5-only property: Trace_signals
  end record;

  type axi5_w_s2m_t is record
    wready : std_logic;
  end record;

  type axi5_w_t is record
    m2s: axi5_w_m2s_t;
    s2m: axi5_w_s2m_t;
  end record;

  type axi5_w_io_t is record
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wlast    : std_logic;
    wuser    : std_logic_vector;
    wvalid   : std_logic;

    wdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    wpoison  : std_logic_vector; -- AXI5-only property: Poison
    wtrace   : std_logic;        -- AXI5-only property: Trace_signals

    wready   : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5 write response(B) interface
  -----------------------------------------------------------------------------
  type axi5_b_m2s_t is record
    bready : std_logic;
  end record;

  type axi5_b_s2m_t is record
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
    bloop  : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;

  type axi5_b_t is record
    m2s: axi5_b_m2s_t;
    s2m: axi5_b_s2m_t;
  end record;

  type axi5_b_io_t is record
    bready : std_logic;

    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;
    bvalid : std_logic;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
    bloop  : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5 read address(AR) interface
  -----------------------------------------------------------------------------
  type axi5_ar_m2s_t is record
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arlen       : std_logic_vector(7 downto 0);
    arsize      : std_logic_vector(2 downto 0);
    arburst     : std_logic_vector(1 downto 0);
    arlock      : std_logic;
    arcache     : std_logic_vector(3 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    arqos       : std_logic_vector(3 downto 0);
    arregion    : std_logic_vector(3 downto 0);
    aruser      : std_logic_vector;
    arvalid     : std_logic;

    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
    arloop      : std_logic_vector; -- AXI5-only property: Loopback_Signals

    armmusecsid : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmusid    : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussidv  : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussid   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmuatst   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions

    arnsaid     : std_logic_vector; -- AXI5-only property: NSAccess_Identifiers
  end record;

  type axi5_ar_s2m_t is record
    arready     : std_logic;
  end record;

  type axi5_ar_t is record
    m2s: axi5_ar_m2s_t;
    s2m: axi5_ar_s2m_t;
  end record;

  type axi5_ar_io_t is record
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arlen       : std_logic_vector(7 downto 0);
    arsize      : std_logic_vector(2 downto 0);
    arburst     : std_logic_vector(1 downto 0);
    arlock      : std_logic;
    arcache     : std_logic_vector(3 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    arqos       : std_logic_vector(3 downto 0);
    arregion    : std_logic_vector(3 downto 0);
    aruser      : std_logic_vector;
    arvalid     : std_logic;

    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
    arloop      : std_logic_vector; -- AXI5-only property: Loopback_Signals

    armmusecsid : std_logic;        -- AXI5-only property: Untranslated_Transactions
    armmusid    : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussidv  : std_logic;        -- AXI5-only property: Untranslated_Transactions
    armmussid   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmuatst   : std_logic;        -- AXI5-only property: Untranslated_Transactions

    arnsaid     : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers

    arready     : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5 read data(R) interface
  -----------------------------------------------------------------------------
  type axi5_r_m2s_t is record
    rready : std_logic;
  end record;

  type axi5_r_s2m_t is record
    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
    rlast    : std_logic;
    ruser    : std_logic_vector;
    rvalid   : std_logic;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
    rloop    : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;

  type axi5_r_t is record
    m2s: axi5_r_m2s_t;
    s2m: axi5_r_s2m_t;
  end record;

  type axi5_r_io_t is record
    rready   : std_logic;

    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
    rlast    : std_logic;
    ruser    : std_logic_vector;
    rvalid   : std_logic;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
    rloop    : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5 optional (OPT) interface
  -----------------------------------------------------------------------------
  type axi5_opt_m2s_t is record
    awakeup         : std_logic;                    -- AXI5-only property: Wakeup_Signals
    broadcastatomic : std_logic;                    -- AXI5-only property: Wakeup_Signals
  end record;

  type axi5_opt_s2m_t is record
    vawqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
    varqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
  end record;

  type axi5_opt_t is record
    m2s: axi5_opt_m2s_t;
    s2m: axi5_opt_s2m_t;
  end record;

  type axi5_opt_io_t is record
    awakeup         : std_logic;                    -- AXI5-only property: Wakeup_Signals
    broadcastatomic : std_logic;                    -- AXI5-only property: Wakeup_Signals

    vawqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
    varqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
  end record;


  -----------------------------------------------------------------------------
  -- Full AXI5 interfaces
  -----------------------------------------------------------------------------
  type axi5_rd_t is record
    ar: axi5_ar_t;
    r:  axi5_r_t;
  end record;

  type axi5_wr_t is record
    aw: axi5_aw_t;
    w:  axi5_w_t;
    b:  axi5_b_t;
  end record;

  type axi5_t is record
    aw: axi5_aw_t;
    w:  axi5_w_t;
    b:  axi5_b_t;

    ar: axi5_ar_t;
    r:  axi5_r_t;
  end record;

  type axi5_rd_m2s_t is record
    ar: axi5_ar_m2s_t;
    r:  axi5_r_m2s_t;
  end record;

  type axi5_rd_s2m_t is record
    ar: axi5_ar_s2m_t;
    r:  axi5_r_s2m_t;
  end record;

  type axi5_wr_m2s_t is record
    aw: axi5_aw_m2s_t;
    w:  axi5_w_m2s_t;
    b:  axi5_b_m2s_t;
  end record;

  type axi5_wr_s2m_t is record
    aw: axi5_aw_s2m_t;
    w:  axi5_w_s2m_t;
    b:  axi5_b_s2m_t;
  end record;

  type axi5_m2s_t is record
    aw: axi5_aw_m2s_t;
    w:  axi5_w_m2s_t;
    b:  axi5_b_m2s_t;

    ar: axi5_ar_m2s_t;
    r:  axi5_r_m2s_t;
  end record;

  type axi5_s2m_t is record
    aw: axi5_aw_s2m_t;
    w:  axi5_w_s2m_t;
    b:  axi5_b_s2m_t;

    ar: axi5_ar_s2m_t;
    r:  axi5_r_s2m_t;
  end record;

  type axi5_io_t is record
    ------------------------------
    -- Write Address channel
    ------------------------------
    awid        : std_logic_vector;
    awaddr      : std_logic_vector;
    awlen       : std_logic_vector(7 downto 0);
    awsize      : std_logic_vector(2 downto 0);
    awburst     : std_logic_vector(1 downto 0);
    awlock      : std_logic;
    awcache     : std_logic_vector(3 downto 0);
    awprot      : std_logic_vector(2 downto 0);
    awqos       : std_logic_vector(3 downto 0);
    awregion    : std_logic_vector(3 downto 0);
    awuser      : std_logic_vector;
    awvalid     : std_logic;

    awatop      : std_logic_vector(5 downto 0); -- AXI5-only property: Atomic_Transactions
    awtrace     : std_logic;                    -- AXI5-only property: Trace_Signals
    awloop      : std_logic_vector;             -- AXI5-only property: Loopback_Signals

    awmmusecsid : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmusid    : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmussidv  : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmussid   : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmuatst   : std_logic;                    -- AXI5-only property: Untranslated_Transactions

    awnsaid     : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers

    awready     : std_logic;

    ------------------------------
    -- Write Data channel
    ------------------------------
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wlast    : std_logic;
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
    bloop  : std_logic_vector; -- AXI5-only property: Loopback_Signals

    ------------------------------
    -- Read Address channel
    ------------------------------
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arlen       : std_logic_vector(7 downto 0);
    arsize      : std_logic_vector(2 downto 0);
    arburst     : std_logic_vector(1 downto 0);
    arlock      : std_logic;
    arcache     : std_logic_vector(3 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    arqos       : std_logic_vector(3 downto 0);
    arregion    : std_logic_vector(3 downto 0);
    aruser      : std_logic_vector;
    arvalid     : std_logic;

    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
    arloop      : std_logic_vector; -- AXI5-only property: Loopback_Signals

    armmusecsid : std_logic;        -- AXI5-only property: Untranslated_Transactions
    armmusid    : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussidv  : std_logic;        -- AXI5-only property: Untranslated_Transactions
    armmussid   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmuatst   : std_logic;        -- AXI5-only property: Untranslated_Transactions

    arnsaid     : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers

    arready     : std_logic;

    ------------------------------
    -- Read channel
    ------------------------------
    rready   : std_logic;

    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0);
    rlast    : std_logic;
    ruser    : std_logic_vector;
    rvalid   : std_logic;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
    rloop    : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record axi5_t;

end package;

package body axi5_pkg is
end package body axi5_pkg;
