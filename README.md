# AMBA Interfaces

A set of SystemVerilog interfaces and VHDL records for the AMBA interfaces.

Current State: This is a work in progress and all code and records still
need to be tested.

## AMBA AXI & ACE

| Standard     | Rev. B | Rev. C | Rev. D | Rev. E | Rev. F | Rev. G | Rev. H | Rev. I | Rev. J | Rev. K |
| --------     | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| AXI v1.0     | [vhdl](src/axi1_pkg.vhd) |        |        |        |        |        |        |        |        |        |
| AXI v2.0     |        | [vhdl](src/axi2_pkg.vhd) |        |        |        |        |        |        |        |        |
| AXI3         |        |        | [vhdl](src/axi3_pkg.vhd) |        |        |        |        |        |        |        |
| AXI4         |        |        | [vhdl](src/axi4_pkg.vhd) |        |        |        |        |        |        |        |
| AXI4-Lite    |        |        | [vhdl](src/axi4_lite_pkg.vhd) |        |        |        |        |        |        |        |
| AXI4-Stream  |        |        |        |        |        |        |        |        |        |        |
| ACE          |        |        | [vhdl](src/ace_pkg.vhd) | [vhdl](src/ace_rev_e_pkg.vhd)       |        |        |        |        |        |        |
| ACE-Lite     |        |        | [vhdl](src/ace_lite_pkg.vhd) | [vhdl](src/ace_lite_rev_e_pkg.vhd) |        |        |        |        |        |        |
| AXI5         |        |        |        |        | [vhdl](src/axi5.vhd)      |        |        |        |        |        |
| AXI5-Lite    |        |        |        |        | [vhdl](src/axi5_lite.vhd) |        |        |        |        |        |
| AXI5-Stream  |        |        |        |        |        |        |        |        |        |        |
| ACE5         |        |        |        |        | [vhdl](src/ace5.vhd)          |        |        |        |        |        |
| ACE5-Lite    |        |        |        |        | [vhdl](src/ace5_lite.vhd)     |        |        |        |        |        |
| ACE5-LiteACP |        |        |        |        | [vhdl](src/ace5_lite_acp.vhd) |        |        |        |        |        |
| ACE5-LiteDVM |        |        |        |        | [vhdl](src/ace5_lite_dvm.vhd) |        |        |        |        |        |

## APB

| Standard     | Rev. B | Rev. C | Rev. D | Rev. E |
| --------     | ------ | ------ | ------ | ------ |
| APB          | [SystemVerilog](src/apb_if_rev_b.sv) | [SystemVerilog](src/apb_if_rev_c.sv) |        |        |


