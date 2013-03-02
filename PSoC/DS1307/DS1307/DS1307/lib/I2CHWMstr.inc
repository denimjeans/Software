;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: I2CHW.inc
;;   Version: 1.90, Updated on 2012/3/2 at 9:14:43
;;  Generated by PSoC Designer 5.2.2551
;;
;;  DESCRIPTION: Assembler declarations for the I2CHW (Master) user module interface
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2012. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

;-----------------
; Misc
;-----------------
I2CHW_READ:           equ  0x01 ; Set the R/W flag after the slave address.
I2CHW_WRITE:          equ  0x00 ; Clear the R/W flag after the slave address.
I2CHW_XFER_ERROR:     equ  0x00 ; Slave did not ACK

I2CHW_CompleteXfer:   equ  0x00 ; Perform a complete I2C transfer
I2CHW_RepStart:       equ  0x01 ; Perform a complete transfer with a Repeat Start
I2CHW_NoStop:         equ  0x02 ; Perform a complete transfer, but leave off the stop.

I2CHW_NAKslave:       equ  0x00 ; NAK the slave after a read
I2CHW_ACKslave:       equ  0x01 ; ACK the slave after a read

; end of file I2CHW.inc