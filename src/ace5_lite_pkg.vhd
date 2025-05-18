-- AMBA ACE5-Lite Protocol
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

package ace5_lite_pkg is
  -----------------------------------------------------------------------------
  -- Full ACE5-Lite address write(AW) interface
  -----------------------------------------------------------------------------
  type ace5_lite_aw_m2s_t is record
    awvalid       : std_logic;
    awid          : std_logic_vector;
    awaddr        : std_logic_vector;
    awregion      : std_logic_vector(3 downto 0);
    awlen         : std_logic_vector(7 downto 0);
    awsize        : std_logic_vector(2 downto 0);
    awburst       : std_logic_vector(1 downto 0);
    awlock        : std_logic;
    awcache       : std_logic_vector(3 downto 0);
    awprot        : std_logic_vector(2 downto 0);
    awqos         : std_logic_vector(3 downto 0);
    awuser        : std_logic_vector;
    awdomain      : std_logic_vector(1 downto 0);
    awsnoop       : std_logic_vector(3 downto 0);

    awstashnid    : std_logic_vector(10 downto 0); -- ACE5-Lite property: Cache_Stash_Transactions
    awstashniden  : std_logic;                     -- ACE5-Lite property: Cache_Stash_Transactions
    awstashlpid   : std_logic_vector(4 downto 0);  -- ACE5-Lite property: Cache_Stash_Transactions
    awstashlpiden : std_logic;                     -- ACE5-Lite property: Cache_Stash_Transactions

    awtrace       : std_logic;                    -- AXI5-only property: Trace_Signals
    awloop        : std_logic_vector;             -- AXI5-only property: Loopback_Signals

    awmmusecsid   : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmusid      : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmussidv    : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmussid     : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmuatst     : std_logic;                    -- AXI5-only property: Untranslated_Transactions

    awnsaid       : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers
    awatop        : std_logic_vector(5 downto 0); -- AXI5-only property: Atomic_Transactions
  end record;

  type ace5_lite_aw_s2m_t is record
    awready  : std_logic;
  end record;

  type ace5_lite_aw_t is record
    m2s: ace5_lite_aw_m2s_t;
    s2m: ace5_lite_aw_s2m_t;
  end record;

  type ace5_lite_aw_io_t is record
    awvalid       : std_logic;
    awid          : std_logic_vector;
    awaddr        : std_logic_vector;
    awregion      : std_logic_vector(3 downto 0);
    awlen         : std_logic_vector(7 downto 0);
    awsize        : std_logic_vector(2 downto 0);
    awburst       : std_logic_vector(1 downto 0);
    awlock        : std_logic;
    awcache       : std_logic_vector(3 downto 0);
    awprot        : std_logic_vector(2 downto 0);
    awqos         : std_logic_vector(3 downto 0);
    awuser        : std_logic_vector;
    awdomain      : std_logic_vector(1 downto 0);
    awsnoop       : std_logic_vector(3 downto 0);

    awstashnid    : std_logic_vector(10 downto 0); -- ACE5-Lite property: Cache_Stash_Transactions
    awstashniden  : std_logic;                     -- ACE5-Lite property: Cache_Stash_Transactions
    awstashlpid   : std_logic_vector(4 downto 0);  -- ACE5-Lite property: Cache_Stash_Transactions
    awstashlpiden : std_logic;                     -- ACE5-Lite property: Cache_Stash_Transactions

    awtrace       : std_logic;                    -- AXI5-only property: Trace_Signals
    awloop        : std_logic_vector;             -- AXI5-only property: Loopback_Signals

    awmmusecsid   : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmusid      : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmussidv    : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmussid     : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmuatst     : std_logic;                    -- AXI5-only property: Untranslated_Transactions

    awnsaid       : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers
    awatop        : std_logic_vector(5 downto 0); -- AXI5-only property: Atomic_Transactions

    awready     : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE5-Lite write(W) interface
  -----------------------------------------------------------------------------
  type ace5_lite_w_m2s_t is record
    wvalid   : std_logic;
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;
    wlast    : std_logic;
    wuser    : std_logic_vector;

    wdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    wpoison  : std_logic_vector; -- AXI5-only property: Poison
    wtrace   : std_logic;        -- AXI5-only property: Trace_signals
  end record;

  type ace5_lite_w_s2m_t is record
    wready : std_logic;
  end record;

  type ace5_lite_w_t is record
    m2s: ace5_lite_w_m2s_t;
    s2m: ace5_lite_w_s2m_t;
  end record;

  type ace5_lite_w_io_t is record
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
  -- Full ACE5-Lite write response(B) interface
  -----------------------------------------------------------------------------
  type ace5_lite_b_m2s_t is record
    bready : std_logic;
  end record;

  type ace5_lite_b_s2m_t is record
    bvalid : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
    bloop  : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;

  type ace5_lite_b_t is record
    m2s: ace5_lite_b_m2s_t;
    s2m: ace5_lite_b_s2m_t;
  end record;

  type ace5_lite_b_io_t is record
    bready : std_logic;

    bvalid : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
    bloop  : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE5-Lite read address(AR) interface
  -----------------------------------------------------------------------------
  type ace5_lite_ar_m2s_t is record
    arvalid     : std_logic;
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arregion    : std_logic_vector(3 downto 0);
    arlen       : std_logic_vector(7 downto 0);
    arsize      : std_logic_vector(2 downto 0);
    arburst     : std_logic_vector(1 downto 0);
    arlock      : std_logic;
    arcache     : std_logic_vector(3 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    arqos       : std_logic_vector(3 downto 0);
    aruser      : std_logic_vector;

    arsnoop     : std_logic_vector(3 downto 0);
    ardomain    : std_logic_vector(1 downto 0);
    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
    arloop      : std_logic_vector; -- AXI5-only property: Loopback_Signals

    armmusecsid : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmusid    : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussidv  : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussid   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmuatst   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions

    arnsaid     : std_logic_vector; -- AXI5-only property: NSAccess_Identifiers
  end record;

  type ace5_lite_ar_s2m_t is record
    arready     : std_logic;
  end record;

  type ace5_lite_ar_t is record
    m2s: ace5_lite_ar_m2s_t;
    s2m: ace5_lite_ar_s2m_t;
  end record;

  type ace5_lite_ar_io_t is record
    arvalid     : std_logic;
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arregion    : std_logic_vector(3 downto 0);
    arlen       : std_logic_vector(7 downto 0);
    arsize      : std_logic_vector(2 downto 0);
    arburst     : std_logic_vector(1 downto 0);
    arlock      : std_logic;
    arcache     : std_logic_vector(3 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    arqos       : std_logic_vector(3 downto 0);
    aruser      : std_logic_vector;

    arsnoop     : std_logic_vector(3 downto 0);
    ardomain    : std_logic_vector(1 downto 0);
    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
    arloop      : std_logic_vector; -- AXI5-only property: Loopback_Signals

    armmusecsid : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmusid    : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussidv  : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussid   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmuatst   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions

    arnsaid     : std_logic_vector; -- AXI5-only property: NSAccess_Identifiers

    arready     : std_logic;
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE5-Lite read data(R) interface
  -----------------------------------------------------------------------------
  type ace5_lite_r_m2s_t is record
    rready : std_logic;
  end record;

  type ace5_lite_r_s2m_t is record
    rvalid   : std_logic;
    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0); -- Can be 4 bits
    rlast    : std_logic;
    ruser    : std_logic_vector;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
    rloop    : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;

  type ace5_lite_r_t is record
    m2s: ace5_lite_r_m2s_t;
    s2m: ace5_lite_r_s2m_t;
  end record;

  type ace5_lite_r_io_t is record
    rready   : std_logic;

    rvalid   : std_logic;
    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0); -- Can be 4 bits
    rlast    : std_logic;
    ruser    : std_logic_vector;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
    rloop    : std_logic_vector; -- AXI5-only property: Loopback_Signals
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE5-Lite optional (OPT) interface
  -----------------------------------------------------------------------------
  type ace5_lite_opt_m2s_t is record
    awakeup         : std_logic;  -- AXI5-only property: Wakeup_Signals
    broadcastatomic : std_logic;
  end record;

  type ace5_lite_opt_s2m_t is record
    vawqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
    varqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
  end record;

  type ace5_lite_opt_t is record
    m2s: ace5_lite_opt_m2s_t;
    s2m: ace5_lite_opt_s2m_t;
  end record;

  type ace5_lite_opt_io_t is record
    awakeup         : std_logic;  -- AXI5-only property: Wakeup_Signals
    broadcastatomic : std_logic;

    vawqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
    varqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
  end record;


  -----------------------------------------------------------------------------
  -- Full ACE5-Lite interfaces
  -----------------------------------------------------------------------------
  type ace5_lite_rd_t is record
    ar: ace5_lite_ar_t;
    r:  ace5_lite_r_t;
  end record;

  type ace5_lite_wr_t is record
    aw: ace5_lite_aw_t;
    w:  ace5_lite_w_t;
    b:  ace5_lite_b_t;
  end record;

  type ace5_lite_t is record
    aw: ace5_lite_aw_t;
    w:  ace5_lite_w_t;
    b:  ace5_lite_b_t;

    ar: ace5_lite_ar_t;
    r:  ace5_lite_r_t;

    opt: ace5_lite_opt_t;
  end record;

  type ace5_lite_rd_m2s_t is record
    ar: ace5_lite_ar_m2s_t;
    r:  ace5_lite_r_m2s_t;
  end record;

  type ace5_lite_rd_s2m_t is record
    ar: ace5_lite_ar_s2m_t;
    r:  ace5_lite_r_s2m_t;
  end record;

  type ace5_lite_wr_m2s_t is record
    aw: ace5_lite_aw_m2s_t;
    w:  ace5_lite_w_m2s_t;
    b:  ace5_lite_b_m2s_t;
  end record;

  type ace5_lite_wr_s2m_t is record
    aw: ace5_lite_aw_s2m_t;
    w:  ace5_lite_w_s2m_t;
    b:  ace5_lite_b_s2m_t;
  end record;

  type ace5_lite_m2s_t is record
    aw: ace5_lite_aw_m2s_t;
    w:  ace5_lite_w_m2s_t;
    b:  ace5_lite_b_m2s_t;

    ar: ace5_lite_ar_m2s_t;
    r:  ace5_lite_r_m2s_t;

    opt: ace5_lite_opt_m2s_t;
  end record;

  type ace5_lite_s2m_t is record
    aw: ace5_lite_aw_s2m_t;
    w:  ace5_lite_w_s2m_t;
    b:  ace5_lite_b_s2m_t;

    ar: ace5_lite_ar_s2m_t;
    r:  ace5_lite_r_s2m_t;

    opt: ace5_lite_opt_s2m_t;
  end record;

  type ace5_lite_io_t is record
    ------------------------------
    -- Write Address channel
    ------------------------------
    awvalid       : std_logic;
    awid          : std_logic_vector;
    awaddr        : std_logic_vector;
    awregion      : std_logic_vector(3 downto 0);
    awlen         : std_logic_vector(7 downto 0);
    awsize        : std_logic_vector(2 downto 0);
    awburst       : std_logic_vector(1 downto 0);
    awlock        : std_logic;
    awcache       : std_logic_vector(3 downto 0);
    awprot        : std_logic_vector(2 downto 0);
    awqos         : std_logic_vector(3 downto 0);
    awuser        : std_logic_vector;
    awdomain      : std_logic_vector(1 downto 0);
    awsnoop       : std_logic_vector(3 downto 0);

    awstashnid    : std_logic_vector(10 downto 0); -- ACE5-Lite property: Cache_Stash_Transactions
    awstashniden  : std_logic;                     -- ACE5-Lite property: Cache_Stash_Transactions
    awstashlpid   : std_logic_vector(4 downto 0);  -- ACE5-Lite property: Cache_Stash_Transactions
    awstashlpiden : std_logic;                     -- ACE5-Lite property: Cache_Stash_Transactions

    awtrace       : std_logic;                    -- AXI5-only property: Trace_Signals
    awloop        : std_logic_vector;             -- AXI5-only property: Loopback_Signals

    awmmusecsid   : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmusid      : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmussidv    : std_logic;                    -- AXI5-only property: Untranslated_Transactions
    awmmussid     : std_logic_vector;             -- AXI5-only property: Untranslated_Transactions
    awmmuatst     : std_logic;                    -- AXI5-only property: Untranslated_Transactions

    awnsaid       : std_logic_vector(3 downto 0); -- AXI5-only property: NSAccess_Identifiers
    awatop        : std_logic_vector(5 downto 0); -- AXI5-only property: Atomic_Transactions

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

    bvalid : std_logic;
    bid    : std_logic_vector;
    bresp  : std_logic_vector(1 downto 0);
    buser  : std_logic_vector;

    btrace : std_logic;        -- AXI5-only property: Trace_Signals
    bloop  : std_logic_vector; -- AXI5-only property: Loopback_Signals

    ------------------------------
    -- Read Address channel
    ------------------------------
    arvalid     : std_logic;
    arid        : std_logic_vector;
    araddr      : std_logic_vector;
    arregion    : std_logic_vector(3 downto 0);
    arlen       : std_logic_vector(7 downto 0);
    arsize      : std_logic_vector(2 downto 0);
    arburst     : std_logic_vector(1 downto 0);
    arlock      : std_logic;
    arcache     : std_logic_vector(3 downto 0);
    arprot      : std_logic_vector(2 downto 0);
    arqos       : std_logic_vector(3 downto 0);
    aruser      : std_logic_vector;

    arsnoop     : std_logic_vector(3 downto 0);
    ardomain    : std_logic_vector(1 downto 0);
    artrace     : std_logic;        -- AXI5-only property: Trace_Signals
    arloop      : std_logic_vector; -- AXI5-only property: Loopback_Signals

    armmusecsid : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmusid    : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussidv  : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmussid   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions
    armmuatst   : std_logic_vector; -- AXI5-only property: Untranslated_Transactions

    arnsaid     : std_logic_vector; -- AXI5-only property: NSAccess_Identifiers

    arready     : std_logic;

    ------------------------------
    -- Read channel
    ------------------------------
    rready   : std_logic;

    rvalid   : std_logic;
    rid      : std_logic_vector;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector(1 downto 0); -- Can be 4 bits
    rlast    : std_logic;
    ruser    : std_logic_vector;

    rdatachk : std_logic_vector; -- AXI5-only property: Check_Type
    rpoison  : std_logic_vector; -- AXI5-only property: Poison
    rtrace   : std_logic;        -- AXI5-only property: Trace_Signals
    rloop    : std_logic_vector; -- AXI5-only property: Loopback_Signals

    ------------------------------
    -- Additional signals
    ------------------------------
    awakeup         : std_logic;  -- AXI5-only property: Wakeup_Signals
    broadcastatomic : std_logic;

    vawqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept
    varqosaccept    : std_logic_vector(3 downto 0); -- AXI5-only property: QoS_Accept

  end record ace5_lite_t;
end package;

package body ace5_lite_pkg is
end package body ace5_lite_pkg;
