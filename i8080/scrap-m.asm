; +----------------------------------------------------------------------------+
; | SCRAP * Synchronized Client Register Access Protocol                       |
; | Copyright (C) 2026 Pozsar Zsolt <pozsarzs@gmail.com>                       |
; | scrap-m.asm                                                                |
; | Common commands, i8080, CP/M-80, v0.1                                      |
; +----------------------------------------------------------------------------+

; This program is free software: you can redistribute it and/or modify it
; under the terms of the MIT License.
;
; This program is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
; FOR A PARTICULAR PURPOSE.

; --- API FUNCTION -------------------------------------

PUBLIC CMD0
PUBLIC CMD1
PUBLIC CMD2

; --- QUERY THE CLIENT VERSION -------------------------
; Input:     A = node ID                    (0-Fh)
; Output:    HL = client version            (00-FFh)
;            Carry = 0
CMD0:
	RET

; --- DIRECT MEMORY CELL READ --------------------------
; Input:     A = node ID                    (0-Fh)
;            B = entry                      (00-FFh)
;            C = count                      (00-FFh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (00-03h)
;            Carry = 0
CMD1:
	RET

; --- DIRECT MEMORY CELL WRITE -------------------------
; Input:     A = node ID                    (0-Fh)
;            B = entry                      (00-FFh)
;            C = count                      (00-FFh)
;            DE = address of the Data Table (0000-FFFFh)
; Output:    A = error Code                 (00-03h)
;            Carry = 0
CMD2:
	RET

; --- DATA AREA ----------------------------------------

	END
