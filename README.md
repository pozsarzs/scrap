# SCRAP
**Synchronized Client Register Access Protocol** 

## 1. Concept

- Goal: simple, assembly-implementable, low-resource binary protocol for serial
  connection of retro MCUs and CPUs.
- Connection: master-client based, single- or multi-client connection.
- Data model: remote shared memory principle. There is a 256-byte data table on
  each side (one for each unique identifier). The application only sees and
  handles these tables. Cell permissions (Disable, RO, WO, RW) are "hardwired"
  into the firmware on the client side.
- Operation mode: remote command call.


## 2. Telegram structure

The telegram is structured the same for both a request and a response:

`hh hh ac nn dd...dd ss`
`hh hh ac 00 ee ss`

|byte|sign|description                                        |
|---:|:--:|---------------------------------------------------|
| 1-2| hh |header for bit-syncronization and framing          |
|   3|  a |high nibble = device address (0-F)                 |
|   3|  c |low nibble = command code (0-F)                    |
|   4| nn |number of data bytes (00-FF)                       |
|   5| ee |error code (00-FF)                                 |
|  5-| dd |data                                               |
|last| ss |checksum                                           |

### Header (hh hh)

The header is required for bit synchronization and framing and its content
determines the direction of the telegram:

- _request_: 55h AAh,  
- _response_: AAh 55h.  


### Address (a)

The _high nibble_ of the 3rd byte is the uniqe ID of the client:
- _Address 0_ is reserved for point-to-point mode. In this case, the receiving
  side does not perform address checking, so all devices respond to the request.
  Do not use address 0 in multi-client mode.
- _Addresses 1-F_ are addresses that can be used in multi-client mode.


### Command \(c\)
The _low nibble_ of the 3rd byte is the command code. The commands specify the
operations to be performed on the 256-byte data table.:
- _Command 0_ queries the client version. The response contains the 16-bit
  version number that specifies the client's command set and the permissions
  for the data table cells.
- _Command 1_ reads the cells of the data table directly.
- _Command 2_ writes the cells of the data table directly.
- _Command 3-F_: User defined, version-dependent individual operations (e.g. block
  write/read), where the source and destination are always the data table.


### Number of data bytes (nn)

Number of transmitted data bytes. If the response contains no data, then
this number is 01h and the data byte is 00h. If the request was incorrect, then
this number in the response is 00h and the data byte is the error code.

### Data bytes (dd)

Transmitted data bytes or error code.

### Error code (ee)

If the data length in the response is 00h, then the first and only data byte is
one of the following error codes:

- _01h_: Integrity check failed.
- _02h_: Command not supported.
- _03h_: Data length mismatch for the given command.
- _04h_: Permission denied (e.g., writing to RO cell).

### Checksum (ss)

8-bit Modulo 256 sum of the bytes after the header.


## 3. Examples

|function               |telegram                    |a|c|n |d          |ss|note|
|-----------------------|----------------------------|-|-|--|-----------|--|----|
|query client version   |`55 AA 60 00 60`            |6|0|00|           |60|[1] |
|- succesful query      |`AA 55 60 02 22 11 95`      |6|0|02|22 95      |95|[2] |
|- unsuccesful query    |`AA 55 60 00 02 62`         |6|0|00|02         |62|[3] |
|direct data table read |`55 AA 01 02 0A 10 1D`      |0|1|02|0A 10      |1D|[4] |
|- succesful read       |`AA 55 01 07 FF .. FF 01`   |0|1|07|FF .. FF   |01|[5] |
|- unsuccesful read     |`AA 55 01 00 02 03`         |0|1|00|02         |03|[3] |
|direct data table write|`55 AA 01 04 0A EE EE EE D9`|0|1|04|0A EE EE EE|D9|[6] |
|- succesful write      |`AA 55 01 01 00 02`         |0|1|00|00         |02|[7] |
|- unsuccesful read     |`AA 55 01 00 01 02`         |0|1|00|01         |02|[3] |
|call remote command #12|`55 AA 7C 03 DE 1D 06 80`   |7|C|03|DE 1D 06   |80|[8] |
|- response with data   |`AA 55 7C 02 01 E6 65`      |7|C|02|01 E6      |65|[9] |
|- response without data|`AA 55 7C 01 00 7D`         |7|C|01|00         |7D|[10]|
|- response with error  |`AA 55 7C 00 02 7E`         |7|C|00|02         |7E|[3] |

[1]: Multi-client mode, address = 06h.  
[2]: Successful query, version = 2211h.  
[3]: Unsuccesful operation, error code in the data byte.  
[4]: Single-client mode, read bytes from cells 0A-10h (7 byte).  
[5]: Succesful read, data are 7 bytes.  
[6]: Single-client mode, write 3 bytes from cells 0Ah (to 0Ch).  
[7]: Succesful write, no data bytes received.  
[8]: Multi-client mode, address = 07h, command = Ch, 3 data bytes transferred.  
[9]: Multi-client mode, address = 07h, command = Ch, 2 data bytes received.  
[10]: Multi-client mode, address = 07h, command = Ch, no data bytes received.  


## 4. Implementations

The following assembly implementations are under development and will be
available soon as linkable .REL files:

- _Intel 8080_: Targeted for CP/M OS,
- _Zilog Z80_: Targeted for CP/M OS,
- _Intel 8051_: Generic assembly implementation.
