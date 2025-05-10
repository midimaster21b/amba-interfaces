library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package axi4_stream_pkg is
  -----------------------------------------------------------------------------
  -- Full AXI4-stream interface
  -----------------------------------------------------------------------------
  type axi4_stream_t is record
    tvalid      : std_logic;
    tready      : std_logic;
    tdata       : std_logic_vector;
    tstrb       : std_logic_vector;
    tkeep       : std_logic_vector;
    tlast       : std_logic;
    tid         : std_logic_vector;
    tdest       : std_logic_vector;
    tuser       : std_logic_vector;
  end record axi4_stream_t;

  -----------------------------------------------------------------------------
  -- AXI4-stream master output interface
  -----------------------------------------------------------------------------
  type axi4_stream_mo_t is record
    tvalid      : std_logic;
    tdata       : std_logic_vector;
    tstrb       : std_logic_vector;
    tkeep       : std_logic_vector;
    tlast       : std_logic;
    tid         : std_logic_vector;
    tdest       : std_logic_vector;
    tuser       : std_logic_vector;
  end record axi4_stream_mo_t;

  -----------------------------------------------------------------------------
  -- AXI4-stream master input interface
  -----------------------------------------------------------------------------
  type axi4_stream_mi_t is record
    tready      : std_logic;
  end record axi4_stream_mi_t;
end package;

package body axi4_stream_pkg is
end package body axi4_stream_pkg;
