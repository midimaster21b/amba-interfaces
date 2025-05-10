library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axi4_lite_pkg is
  -----------------------------------------------------------------------------
  -- Full AXI4-Lite interface
  -----------------------------------------------------------------------------
  type axi4_lite_t is record
    -- Write address channel
    awvalid  : std_logic;
    awready  : std_logic;
    awaddr   : std_logic_vector;
    awprot   : std_logic_vector;

    -- Write data channel
    wvalid   : std_logic;
    wready   : std_logic;
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;

    -- Write response channel
    bvalid   : std_logic;
    bready   : std_logic;
    bresp    : std_logic_vector;

    -- Read address channel
    arvalid  : std_logic;
    arready  : std_logic;
    araddr   : std_logic_vector;
    arprot   : std_logic_vector;

    -- Read data channel
    rvalid   : std_logic;
    rready   : std_logic;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector;
  end record axi4_lite_t;

  -----------------------------------------------------------------------------
  -- AXI4-Lite master output interface
  -----------------------------------------------------------------------------
  type axi4_lite_mo_t is record
    -- Write address channel
    awvalid  : std_logic;
    awaddr   : std_logic_vector;
    awprot   : std_logic_vector;

    -- Write data channel
    wvalid   : std_logic;
    wdata    : std_logic_vector;
    wstrb    : std_logic_vector;

    -- Write response channel
    bready   : std_logic;

    -- Read address channel
    arvalid  : std_logic;
    araddr   : std_logic_vector;
    arprot   : std_logic_vector;

    -- Read data channel
    rready   : std_logic;
  end record axi4_lite_mo_t;

  -----------------------------------------------------------------------------
  -- AXI4-Lite master input interface
  -----------------------------------------------------------------------------
  type axi4_lite_mi_t is record
    -- Write address channel
    awready  : std_logic;

    -- Write data channel
    wready   : std_logic;

    -- Write response channel
    bvalid   : std_logic;
    bresp    : std_logic_vector;

    -- Read address channel
    arready  : std_logic;

    -- Read data channel
    rvalid   : std_logic;
    rdata    : std_logic_vector;
    rresp    : std_logic_vector;
  end record axi4_lite_mi_t;
end package;

package body axi4_lite_pkg is
end package body axi4_lite_pkg;
