# AXI3 Usage

## Ports

```VHDL
------------------------------------------
-- Full interface
------------------------------------------
-- Separated in and out ports
m_axi_full_tst_out : out axi3_m2s_t;
m_axi_full_tst_in  : in  axi3_s2m_t;

s_axi_full_tst_in  : in  axi3_m2s_t;
s_axi_full_tst_out : out axi3_s2m_t;

-- Inout test
m_axi_full_tst_io : inout axi3_io_t;

s_axi_full_tst_io : inout axi3_io_t;

------------------------------------------
-- Write only interface
------------------------------------------
-- Separated in and out ports
m_axi_wr_tst_out : out axi3_wr_m2s_t;
m_axi_wr_tst_in  : in  axi3_wr_s2m_t;

s_axi_wr_tst_in  : in  axi3_wr_m2s_t;
s_axi_wr_tst_out : out axi3_wr_s2m_t;

-- Inout test
m_axis_wr_tst_io : inout axi3_wr_io_t;

s_axis_wr_tst_io : inout axi3_wr_io_t;

------------------------------------------
-- Read only interface
------------------------------------------
-- Separated in and out ports
m_axi_rd_tst_out : out axi3_rd_m2s_t;
m_axi_rd_tst_in  : in  axi3_rd_s2m_t;

s_axi_rd_tst_in  : in  axi3_rd_m2s_t;
s_axi_rd_tst_out : out axi3_rd_s2m_t;

-- Inout test
m_axis_rd_tst_io : inout axi3_rd_io_t;

s_axis_rd_tst_io : inout axi3_rd_io_t;

```
