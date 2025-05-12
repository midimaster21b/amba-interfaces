# Advanced eXtensible Interface 3 (AXI3)

## Write Channel

### Write Address (AW) Signals

| Signal Name  | Direction | Description |
| ------------ | --------- | ----------- |
| AWVALID      | M -> S    | Valid handshake signal |
| AWREADY      | S -> M    | Ready handshake signal |
| AWADDR[31:0] | M -> S    | Write address |
| AWSIZE[2:0]  | M -> S    | See address section below |
| AWCACHE[3:0] | M -> S    | See address section below |
| AWPROT[2:0]  | M -> S    | See address section below |
| AWLOCK[1:0]  | M -> S    | See address section below |
| AWBURST[1:0] | M -> S    | See burst section below |
| AWID[x:0]    | M -> S    | See burst section below |
| AWLEN[3:0]   | M -> S    | See burst section below |


### Write Data (W) Signals

| Signal Name | Direction | Description |
| ----------- | --------- | ----------- |
| WVALID      | M -> S    | Valid handshake signals |
| WREADY      | S -> M    | Ready handshake signals |
| WLAST       | M -> S    | Indicator for the last beat in a data stream |
| WDATA[x:0]  | M -> S    | Data to be written |
| WSTRB[x:0]  | M -> S    | Data mask to indicate valid data within the beat |
| WID[x:0]    | M -> S    | Stream indicator matching address stream ID |


### Write Response (B) Signals

| Signal Name | Direction | Description |
| ----------- | --------- | ----------- |
| BWVALID     | S -> M    | Valid handshake signal |
| BWREADY     | M -> S    | Ready handshake signal |
| BRESP[1:0]  | S -> M    | Response for write data associated with stream ID |
| BID[x:0]    | S -> M    | Stream ID associated with this response |


## Read Channels

| Signal Name  | Direction | Description |
| ------------ | --------- | ----------- |
| ARVALID      | M -> S    | Valid handshake signal |
| AREADY       | S -> M    | Ready handshake signal |
| ARADDR[31:0] | M -> S    | Read address |
| ARCACHE[3:0] | M -> S    | See address section below |
| ARPROT[2:0]  | M -> S    | See address section below |
| ARLOCK[1:0]  | M -> S    | See address section below |
| ARSIZE[2:0]  | M -> S    | See burst section below |
| ARBURST[1:0] | M -> S    | See burst section below |
| ARID[x:0]    | M -> S    | See burst section below |
| ARLEN[3:0]   | M -> S    | See burst section below |


### Read Data (R) Signals

| Signal Name | Direction | Description |
| ----------- | --------- | ----------- |
| RVALID      | S -> M    | Valid handshake signal |
| RREADY      | M -> S    | Ready handshake signal |
| RLAST       | S -> M    | Indicator for the last beat in the read data stream |
| RDATA[x:0]  | S -> M    | Read data |
| RRESP[1:0]  | S -> M    | Response value indicating the success or failure of the read |
| RID[x:0]    | S -> M    | See burst section below |


## Address Signals

TODO: Add fill in this section

## Burst Signals

TODO: Add fill in this section
