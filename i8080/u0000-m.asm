; +----------------------------------------------------------------------------+
; | SCRAP * Synchronized Client Register Access Protocol                       |
; | Copyright (C) 2026 Pozsar Zsolt <pozsarzs@gmail.com>                       |
; | u0000-m.asm                                                                |
; | User commands, i8080, CP/M-80, v0.1                                        |
; +----------------------------------------------------------------------------+

; This program is free software: you can redistribute it and/or modify it
; under the terms of the European Union Public License 1.2 version.
;
; This program is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
; FOR A PARTICULAR PURPOSE.

; --- API FUNCTION -------------------------------------

PUBLIC CMD3
PUBLIC CMD4
PUBLIC CMD5
PUBLIC CMD6
PUBLIC CMD7
PUBLIC CMD8
PUBLIC CMD9
PUBLIC CMDA
PUBLIC CMDB
PUBLIC CMDC
PUBLIC CMDD
PUBLIC CMDE
PUBLIC CMDF

; --- USER COMMAND #3 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD3:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #4 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD4:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #5 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD5:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #6 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD6:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #7 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD7:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #8 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD8:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #9 ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMD9:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #A ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMDA:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #B ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMDB:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #C ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMDC:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #D ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMDD:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #E ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMDE:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- USER COMMAND #F ----------------------------------
; Input:     A = node ID                    (0-Fh)
;            DE = address of the data table (0000-FFFFh)
; Output:    A = error Code                 (FFh)
;            Carry = 1
CMDF:
	MVI	A, FFh		; error code = FFh 
	SCF			; set Carry flag
	RET

; --- DATA AREA ----------------------------------------

	END
