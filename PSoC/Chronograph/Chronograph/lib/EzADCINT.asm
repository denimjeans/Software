;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: EzADCINT.asm
;;  Version: 1.00, Updated on 2012/9/21 at 11:59:1
;;
;;  DESCRIPTION: Assembler interrupt service routine for the EzADC
;;               A/D Converter User Module. This code works for both the
;;               first and second-order modulator topologies.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2012. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "EzADC.inc"


;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------

export _EzADC_ADConversion_ISR

export _EzADC_iResult
export  EzADC_iResult
export _EzADC_fStatus
export  EzADC_fStatus
export _EzADC_bState
export  EzADC_bState
export _EzADC_fMode
export  EzADC_fMode
export _EzADC_bNumSamples
export  EzADC_bNumSamples
export _EzADC_iOffsetCompensationCounter
export  EzADC_iOffsetCompensationCounter

;-----------------------------------------------
; Variable Allocation
;-----------------------------------------------
AREA InterruptRAM(RAM,REL)
 EzADC_iResult:
_EzADC_iResult:                            BLK  2 ;Calculated answer
  iTemp:                                   BLK  2 ;internal temp storage
 EzADC_fStatus:
_EzADC_fStatus:                            BLK  1 ;ADC Status
 EzADC_bState:
_EzADC_bState:                             BLK  1 ;State value of ADC count
 EzADC_fMode:
_EzADC_fMode:                              BLK  1 ;Integrate and reset mode.
 EzADC_bNumSamples:
_EzADC_bNumSamples:                        BLK  1 ;Integrate and reset mode.
 EzADC_iOffsetCompensationCounter:
_EzADC_iOffsetCompensationCounter:         BLK  1 ;Offset Compensation Counter.
 EzADC_iOffsetCompensationData:
_EzADC_iOffsetCompensationData:            BLK  1 ;Offset Compensation Data

;-----------------------------------------------
;  EQUATES
;-----------------------------------------------

;@PSoC_UserCode_INIT@ (Do not change this line.)
;---------------------------------------------------
; Insert your custom declarations below this banner
;---------------------------------------------------

;------------------------
;  Constant Definitions
;------------------------


;------------------------
; Variable Allocation
;------------------------


;---------------------------------------------------
; Insert your custom declarations above this banner
;---------------------------------------------------
;@PSoC_UserCode_END@ (Do not change this line.)


AREA UserModules (ROM, REL)

;-----------------------------------------------------------------------------
;  FUNCTION NAME: _EzADC_ADConversion_ISR
;
;  DESCRIPTION: Perform final filter operations to produce output samples.
;
;-----------------------------------------------------------------------------
;
;    The decimation rate is established by the PWM interrupt. Four timer
;    clocks elapse for each modulator output (decimator input) since the
;    phi1/phi2 generator divides by 4. This means the timer period and thus
;    it's interrupt must equal 4 times the actual decimation rate.  The
;    decimator is run for 2^(#bits-6).
;
_EzADC_ADConversion_ISR:
    dec  [EzADC_bState]
if1:
    jc endif1 ; no underflow
    reti
endif1:
    cmp [EzADC_fMode],0
if2: 
    jnz endif2  ;leaving reset mode
    push A                            ;read decimator
    mov  A, reg[DEC_DL]
    mov  [iTemp + LowByte],A
    mov  A, reg[DEC_DH]
    mov  [iTemp + HighByte], A
    pop A
    mov [EzADC_fMode],1
    mov [EzADC_bState],((1<<(EzADC_bNUMBITS- 6))-1)
    reti
endif2:
    ;This code runs at end of integrate
    EzADC_RESET_INTEGRATOR_M
    push A
    mov  A, reg[DEC_DL]
    sub  A,[iTemp + LowByte]
    mov  [iTemp +LowByte],A
    mov  A, reg[DEC_DH]
    sbb  A,[iTemp + HighByte]
    asr  A
    rrc  [iTemp + LowByte]

       ;Covert to Unipolar
IF  EzADC_9_OR_MORE_BITS
    add  A, (1<<(EzADC_bNUMBITS - 9))
ELSE
    add [iTemp + LowByte], (1<<(EzADC_bNUMBITS - 1)) ;work on lower Byte
    adc A,0 
ENDIF
       ;check for overflow
IF  EzADC_8_OR_MORE_BITS
    cmp A,(1<<(EzADC_bNUMBITS - 8))
if3: 
    jnz endif3 ;overflow
    dec A
    mov [iTemp + LowByte],ffh
endif3:
ELSE
    cmp [iTemp + LowByte],(1<<(EzADC_bNUMBITS))
if4: 
    jnz endif4 ;overflow
    dec [iTemp + LowByte]
endif4:
ENDIF

IF EzADC_OFFSET_COMPENSATION
IF EzADC_OC_CNT_SIZE_IS_TWO_BYTE
    cmp   [EzADC_iOffsetCompensationCounter+LowByte],<EzADC_OFFSET_COMPENSATION_FREQUENCY
    jnz   ContinueConversion
    cmp   [EzADC_iOffsetCompensationCounter+HighByte],>EzADC_OFFSET_COMPENSATION_FREQUENCY
ELSE
    cmp   [EzADC_iOffsetCompensationCounter],EzADC_OFFSET_COMPENSATION_FREQUENCY
ENDIF
    jnz   ContinueConversion
IF EzADC_9_OR_MORE_BITS
    sub   A, (1<<(EzADC_bNUMBITS - 9))
ELSE
    sub   [iTemp +LowByte], (1<<(EzADC_bNUMBITS - 1))
    sbb   A, 0
ENDIF
    mov   [EzADC_iOffsetCompensationData],[iTemp + LowByte]
    lcall EzADC_RestoreInputADC
    jmp   ConversionReady
ENDIF

ContinueConversion:
IF EzADC_SIGNED_DATA
IF EzADC_9_OR_MORE_BITS
    sub A,(1<<(EzADC_bNUMBITS - 9))
ELSE
    sub [iTemp +LowByte],(1<<(EzADC_bNUMBITS - 1))
    sbb A,0
ENDIF
ENDIF
    mov  [EzADC_iResult + LowByte],[iTemp +LowByte]
    mov  [EzADC_iResult + HighByte],A

IF EzADC_OFFSET_COMPENSATION
    mov  A,[EzADC_iOffsetCompensationData]
    and  A,0x80
    jz   PositiveCompensationData
    mov  A,0xFF
    sub  A,[EzADC_iOffsetCompensationData]
    add  [EzADC_iResult + LowByte],A
    adc  [EzADC_iResult + HighByte],0
    jmp  CompensationReady   
PositiveCompensationData:    
    mov  A,[EzADC_iOffsetCompensationData]
    sub  [EzADC_iResult + LowByte],A
    sbb  [EzADC_iResult + HighByte],0
ENDIF

CompensationReady:   
    mov  [EzADC_fStatus],1
ConversionReady:
    ;@PSoC_UserCode_BODY@ (Do not change this line.)
    ;---------------------------------------------------
    ; Insert your custom code below this banner
    ;---------------------------------------------------
    ;  Sample data is now in iResult
    ;
    ;  NOTE: This interrupt service routine has already
    ;  preserved the values of the A CPU register. If
    ;  you need to use the X register you must preserve
    ;  its value and restore it before the return from
    ;  interrupt.
    ;---------------------------------------------------
    ; Insert your custom code above this banner
    ;---------------------------------------------------
    ;@PSoC_UserCode_END@ (Do not change this line.)
    pop A
    
IF EzADC_OFFSET_COMPENSATION
IF EzADC_OC_CNT_SIZE_IS_TWO_BYTE
    dec  [EzADC_iOffsetCompensationCounter+LowByte]
if7:
    jnc  endif7
    dec  [EzADC_iOffsetCompensationCounter+HighByte]
if9:    
    jc   endif9
    mov  [EzADC_iOffsetCompensationCounter+LowByte],ffh
    jmp  endif7
ELSE
    dec  [EzADC_iOffsetCompensationCounter]
    jnc  endif7
ENDIF
endif9:    
    lcall EzADC_SetInputADCToAGND
endif7:
ENDIF
    
    cmp [EzADC_bNumSamples],0
if5: 
    jnz endif5 ; Number of samples is zero
    mov [EzADC_fMode],0
    mov [EzADC_bState],0
    EzADC_ENABLE_INTEGRATOR_M
    reti       
endif5:
    dec [EzADC_bNumSamples]
if6:
    jz endif6  ; count not zero
    mov [EzADC_fMode],0
    mov [EzADC_bState],0
    EzADC_ENABLE_INTEGRATOR_M
    reti       
endif6:
    ;All samples done
    EzADC_STOPADC_M
 reti 

; end of file EzADCINT.asm
