# Advanced eXtensible Interface 4 (AXI4)

## Write Channels

Changes from AXI3:

- Write data reordering is no longer supported in AXI4 (removed WID bus)
- Longer bursts in AXI4 (AWLEN increased from 4 to 8 bits)
- USER sideband signals added to each channel
- AWLOCK is reduced to a single bit in AXI4
- AWQOS was added for implementing quality of service over AXI4 interfaces
- AWREGION was added to allow multiple device support using a single interface (communication bus support w/o memory mapping)

### Write Address (AW) Signals

| Signal Name   | Direction | Description |
| ------------- | --------- | ----------- |
| AWVALID       | M -> S    | Valid handshake signal |
| AWREADY       | S -> M    | Ready handshake signal |
| AWADDR[31:0]  | M -> S    | Write address |
| AWSIZE[2:0]   | M -> S    | See address section below |
| AWCACHE[3:0]  | M -> S    | See address section below |
| AWPROT[2:0]   | M -> S    | See address section below |
| AWLOCK        | M -> S    | See address section below |
| AWREGION[3:0] | M -> S    | See address section below |
| AWBURST[1:0]  | M -> S    | See burst section below |
| AWID[x:0]     | M -> S    | See burst section below |
| AWLEN[7:0]    | M -> S    | See burst section below |
| AWQOS[3:0]    | M -> S    | See burst section below |
| AWUSER[x:0]   | M -> S    | A sideband for additional data |


### Write Data (W) Signals

| Signal Name | Direction | Description |
| ----------- | --------- | ----------- |
| WVALID      | M -> S    | Valid handshake signals |
| WREADY      | S -> M    | Ready handshake signals |
| WLAST       | M -> S    | Indicator for the last beat in a data stream |
| WDATA[x:0]  | M -> S    | Data to be written |
| WSTRB[x:0]  | M -> S    | Data mask to indicate valid data within the beat |
| WUSER[x:0]  | M -> S    | Sideband for additional user-specified data |


### Write Response (B) Signals

| Signal Name | Direction | Description |
| ----------- | --------- | ----------- |
| BWVALID     | S -> M    | Valid handshake signal |
| BWREADY     | M -> S    | Ready handshake signal |
| BRESP[1:0]  | S -> M    | Response for write data associated with stream ID |
| BID[x:0]    | S -> M    | See burst section below |
| BUSER[x:0]  | S -> M    | Sideband for additional user-specified data |


## Read Channels

Changes from AXI3:

- Longer bursts in AXI4 (AWLEN increased from 4 to 8 bits)
- USER sideband signals added to each channel
- AWLOCK is reduced to a single bit in AXI4
- AWQOS was added for implementing quality of service over AXI4 interfaces
- AWREGION was added to allow multiple device support using a single interface (communication bus support w/o memory mapping)

### Read Address (AR) Signals

| Signal Name   | Direction | Description |
| ------------- | --------- | ----------- |
| ARVALID       | M -> S    | Valid handshake signal |
| AREADY        | S -> M    | Ready handshake signal |
| ARADDR[31:0]  | M -> S    | Read address |
| ARCACHE[3:0]  | M -> S    | See address section below |
| ARPROT[2:0]   | M -> S    | See address section below |
| ARLOCK        | M -> S    | See address section below |
| ARREGION[3:0] | M -> S    | See address section below |
| ARSIZE[2:0]   | M -> S    | See burst section below |
| ARBURST[1:0]  | M -> S    | See burst section below |
| ARID[x:0]     | M -> S    | See burst section below |
| ARLEN[7:0]    | M -> S    | See burst section below |
| ARQOS[3:0]    | M -> S    | See burst section below |
| ARUSER[x:0]   | M -> S    | Sideband for additional user-specified data |


### Read Data (R) Signals

| Signal Name | Direction | Description |
| ----------- | --------- | ----------- |
| RVALID      | S -> M    | Valid handshake signal |
| RREADY      | M -> S    | Ready handshake signal |
| RLAST       | S -> M    | Indicator for the last beat in the read data stream |
| RDATA[x:0]  | S -> M    | Read data |
| RRESP[1:0]  | S -> M    | Response value indicating the success or failure of the read |
| RID[x:0]    | S -> M    | See burst section below |
| RUSER[x:0]  | S -> M    | Sideband for additional user-specified data |

## Address Signals

TODO: Add fill in this section

## Burst Signals

TODO: Add fill in this section
