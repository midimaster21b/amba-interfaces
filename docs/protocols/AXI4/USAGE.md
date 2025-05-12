# AXI4 Usage

## Ports

```VHDL
------------------------------------------
-- Full interface
------------------------------------------
-- Separated in and out ports
m_axi_full_tst_out : out axi4_m2s_t;
m_axi_full_tst_in  : in  axi4_s2m_t;

s_axi_full_tst_in  : in  axi4_m2s_t;
s_axi_full_tst_out : out axi4_s2m_t;

-- Inout test
m_axi_full_tst_io : inout axi4_io_t;

s_axi_full_tst_io : inout axi4_io_t;

------------------------------------------
-- Write only interface
------------------------------------------
-- Separated in and out ports
m_axi_wr_tst_out : out axi4_wr_m2s_t;
m_axi_wr_tst_in  : in  axi4_wr_s2m_t;

s_axi_wr_tst_in  : in  axi4_wr_m2s_t;
s_axi_wr_tst_out : out axi4_wr_s2m_t;

-- Inout test
m_axis_wr_tst_io : inout axi4_wr_io_t;

s_axis_wr_tst_io : inout axi4_wr_io_t;

------------------------------------------
-- Read only interface
------------------------------------------
-- Separated in and out ports
m_axi_rd_tst_out : out axi4_rd_m2s_t;
m_axi_rd_tst_in  : in  axi4_rd_s2m_t;

s_axi_rd_tst_in  : in  axi4_rd_m2s_t;
s_axi_rd_tst_out : out axi4_rd_s2m_t;

-- Inout test
m_axis_rd_tst_io : inout axi4_rd_io_t;

s_axis_rd_tst_io : inout axi4_rd_io_t;

```


## Signals

### Full interface
```VHDL
-- Separated in and out ports
constant ADDR_WIDTH_C : integer := 32;
constant DATA_WIDTH_C : integer := 32;
constant ID_WIDTH_C   : integer := 4;
constant USER_WIDTH_C : integer := 8;


signal axi_full_tst_m2s : axi4_m2s_t(
  axi4_aw_m2s_t(
    awid(ID_WIDTH_C-1 downto 0),
    awaddr(ADDR_WIDTH_C-1 downto 0),
    awuser(USER_WIDTH_C-1 downto 0)
    ),
  axi4_w_m2s_t(
    wdata(DATA_WIDTH_C-1 downto 0),
    wstrb((DATA_WIDTH_C/8)-1 downto 0),
    wuser(USER_WIDTH_C-1 downto 0)
    ),
  axi4_ar_m2s_t(
    arid(ID_WIDTH_C-1 downto 0),
    araddr(ADDR_WIDTH_C-1 downto 0),
    aruser(USER_WIDTH_C-1 downto 0)
    ),
  axi4_r_m2s_t(
    rid(ID_WIDTH_C-1 downto 0),
    rdata(DATA_WIDTH_C-1 downto 0),
    ruser(USER_WIDTH_C-1 downto 0)
    )
);

signal axi_full_tst_s2m : axi4_s2m_t;

axi_full_tst_m2s.aw.awaddr <= x"ABCDBEEF";
```

```VHDL
-- Inout test
signal axi_full_tst_io : axi4_io_t(
    awid(ID_WIDTH_C-1 downto 0),
    awaddr(ADDR_WIDTH_C-1 downto 0),
    awuser(USER_WIDTH_C-1 downto 0),
    wdata(DATA_WIDTH_C-1 downto 0),
    wstrb((DATA_WIDTH_C/8)-1 downto 0),
    wuser(USER_WIDTH_C-1 downto 0),
    arid(ID_WIDTH_C-1 downto 0),
    araddr(ADDR_WIDTH_C-1 downto 0),
    aruser(USER_WIDTH_C-1 downto 0),
    rid(ID_WIDTH_C-1 downto 0),
    rdata(DATA_WIDTH_C-1 downto 0),
    ruser(USER_WIDTH_C-1 downto 0)
);

axi_full_tst_io.awaddr <= x"ABCDBEEF";
```

```VHDL
-- TODO: Expand into example code
------------------------------------------
-- Write only interface
------------------------------------------
-- Separated in and out ports
axi_wr_tst : axi4_wr_m2s_t;
axi_wr_tst : axi4_wr_s2m_t;

-- Inout test
axi_wr_tst_io : axi4_wr_io_t;


------------------------------------------
-- Read only interface
------------------------------------------
-- Separated in and out ports
axi_rd_tst : axi4_rd_m2s_t;
axi_rd_tst : axi4_rd_s2m_t;

-- Inout test
axi_rd_tst_io : axi4_rd_io_t;
```
