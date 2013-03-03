;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: SPIS.inc
;;   Version: 2.60, Updated on 2011/12/1 at 17:23:21
;;  Generated by PSoC Designer 5.2.2401
;;
;;  DESCRIPTION: Assembler declarations for the SPIS user module interface.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2011. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"

;--------------------------------------------------
; Constants for SPIS API's.
;--------------------------------------------------
;mask value for global int reg bit for TX instance
SPIS_bINT_MASK:                        equ 04h
;SPIS interrupt address
SPIS_INT_REG:                          equ 0e1h
SPIS_SW_SS_Feature:                    equ  1

; Old equate, will be removed in future release, Do not use.
bSPIS_INT_MASK:             equ 04h

;-------------------------------
; SPI Configuration definitions
;-------------------------------
SPIS_SPIS_MODE_0:             equ   00h      ;MODE 0 - Leading edge latches data - pos clock
SPIS_SPIS_MODE_1:             equ   02h      ;MODE 1 - Leading edge latches data - neg clock
SPIS_SPIS_MODE_2:             equ   04h      ;MODE 2 - Trailing edge latches data - pos clock
SPIS_SPIS_MODE_3:             equ   06h      ;MODE 3 - Trailing edge latches data - neg clock
SPIS_SPIS_LSB_FIRST:          equ   80h      ;LSB bit transmitted/received first
SPIS_SPIS_MSB_FIRST:          equ   00h      ;MSB bit transmitted/received first
SPIS_SPIS_SLAVE_SELECT:       equ   08h  ; SS Control bit

;---------------------------
; SPI Status register masks
;---------------------------
SPIS_SPIS_RX_OVERRUN_ERROR:   equ   40h      ;Overrun error in received data
SPIS_SPIS_TX_BUFFER_EMPTY:    equ   10h      ;TX Buffer register is ready for next data byte
SPIS_SPIS_RX_BUFFER_FULL:     equ   08h      ;RX Buffer register has received current data
SPIS_SPIS_SPI_COMPLETE:       equ   20h      ;SPI Tx/Rx cycle has completed

;--------------------------------------------------
; Register Address Constants for SPIS
;--------------------------------------------------
SPIS_CONTROL_REG:   equ 2bh                      ;Control register
SPIS_SHIFT_REG: equ 28h                          ;TX Shift Register register
SPIS_TX_BUFFER_REG: equ 29h                      ;TX Buffer Register
SPIS_RX_BUFFER_REG: equ 2ah                      ;RX Buffer Register
SPIS_FUNCTION_REG:  equ 28h                      ;Function register
SPIS_INPUT_REG: equ 29h                          ;Input register
SPIS_OUTPUT_REG:    equ 2ah                      ;Output register

; end of file SPIS.inc