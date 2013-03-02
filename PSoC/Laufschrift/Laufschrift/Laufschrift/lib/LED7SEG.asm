;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME:   LED7SEG.asm
;;  Version: 1.20, Updated on 2011/12/1 at 17:22:54
;;  Generated by PSoC Designer 5.2.2401
;;
;;  DESCRIPTION: Seven Segment LCD user module.
;;
;;  LCD connections to PSoC port
;;
;;    PX.0 ==> SEG a                      a
;;    PX.1 ==> SEG b                    =====
;;    PX.2 ==> SEG c                   ||   || b
;;    PX.3 ==> SEG d                 f || g ||
;;    PX.4 ==> SEG e                    =====
;;    PX.5 ==> SEG f                   ||   || c
;;    PX.6 ==> SEG g                 e ||   ||
;;    PX.7 ==> SEG dp                   =====  # dp
;;                                        d     
;;
;;    PY.i       ==> Digit 1        Digit Number
;;    PY.(i+1)   ==> Digit 2      +---+---+-    +---+
;;    ...                         | 1 | 2 | ... | n |     where n is digit count
;;    PY.(i+n-1) ==> Digit n      +---+---+     +---+      
;;
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2011. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "LED7SEG.inc"
include "memory.inc"

export _LED7SEG_Start
export  LED7SEG_Start

export _LED7SEG_Stop
export  LED7SEG_Stop

export _LED7SEG_Dim
export  LED7SEG_Dim

export _LED7SEG_Update
export  LED7SEG_Update

export _LED7SEG_PutHex
export  LED7SEG_PutHex

export _LED7SEG_PutPattern
export  LED7SEG_PutPattern

export _LED7SEG_DP
export  LED7SEG_DP

export _LED7SEG_DispInt 
export  LED7SEG_DispInt

export  LED7SEG_DigitRAM
export _LED7SEG_DigitRAM

export  LED7SEG_ScanStatus
export _LED7SEG_ScanStatus

area InterruptRAM(RAM, REL, CON)

 LED7SEG_VarPage:                                ; Dummy label for paging

 LED7SEG_ScanStatus:
_LED7SEG_ScanStatus:                         blk      1

 LED7SEG_DigitRAM:
_LED7SEG_DigitRAM:                           blk      LED7SEG_DigitCnt

AREA UserModules (ROM, REL)

;; 
;;  char dp g f e   d c b a    Code  Code
;;   0    0 0 1 1   1 1 1 1    0x3F  0xC0
;;   1    0 0 0 0   0 1 1 0    0x06  0xF9
;;   2    0 1 0 1   1 0 1 1    0x5B  0xA4
;;   3    0 1 0 0   1 1 1 1    0x4F  0xB0
;;   4    0 1 1 0   0 1 1 0    0x66  0x99
;;   5    0 1 1 0   1 1 0 1    0x6D  0x92
;;   6    0 1 1 1   1 1 0 1    0x7D  0x82
;;   7    0 0 0 0   0 1 1 1    0x07  0xF8
;;   8    0 1 1 1   1 1 1 1    0x7F  0x80
;;   9    0 1 1 0   1 1 1 1    0x6F  0x90
;;   A    0 1 1 1   0 1 1 1    0x77  0x88
;;   b    0 1 1 1   1 1 0 0    0x7C  0x83
;;   C    0 0 1 1   1 0 0 1    0x39  0xC6
;;   d    0 1 0 1   1 1 1 0    0x5E  0xA1
;;   E    0 1 1 1   1 0 0 1    0x79  0x86
;;   F    0 1 1 1   0 0 0 1    0x71  0x8E
;;   -    0 1 0 0   0 0 0 0    0x40  0xBF



.LITERAL
 LED7SEG_HexSegMask:

     DB   0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07
     DB   0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
     DB   0x40


 LED7SEG_DigitPortMask:
IF(LED7SEG_DigitDrive)  // Active High Digit Drive
     DB   LED7SEG_Dig1Mask
     DB   LED7SEG_Dig2Mask
     DB   LED7SEG_Dig3Mask
     DB   LED7SEG_Dig4Mask
     DB   LED7SEG_Dig5Mask
     DB   LED7SEG_Dig6Mask
     DB   LED7SEG_Dig7Mask
     DB   LED7SEG_Dig8Mask
ELSE                             // Active Low Digit Drive
     DB   ~LED7SEG_Dig1Mask
     DB   ~LED7SEG_Dig2Mask
     DB   ~LED7SEG_Dig3Mask
     DB   ~LED7SEG_Dig4Mask
     DB   ~LED7SEG_Dig5Mask
     DB   ~LED7SEG_Dig6Mask
     DB   ~LED7SEG_Dig7Mask
     DB   ~LED7SEG_Dig8Mask
ENDIF


DEC_TABLE:   ; Used for base10 display
DW 0x0001, 0x000A, 0x0064, 0x03E8, 0x2710
;    1       10     100     1000   10,000

.ENDLITERAL

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_Start(void)
;
;  DESCRIPTION:
;     Init state machine and clear buffer memory
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    none
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_LED7SEG_Start:
 LED7SEG_Start:
   RAM_PROLOGUE RAM_USE_CLASS_3
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_IDX >LED7SEG_VarPage
   RAM_SETPAGE_CUR >LED7SEG_VarPage
   push   X
   ; Initialize digit RAM
   mov    X,(LED7SEG_DigitCnt-1)
.ClearLoop:
   mov    [X+LED7SEG_DigitRAM],LED7SEG_SegmentInit
   dec    X
   jnc    .ClearLoop

   ; Set scan bit
   mov   [LED7SEG_ScanStatus],LED7SEG_ScanFlag  


   M8C_SetBank1
   or    reg[LED7SEG_DigitPortDM0],LED7SEG_DigitMask
   and   reg[LED7SEG_DigitPortDM1],~LED7SEG_DigitMask
   M8C_SetBank0
   and   reg[LED7SEG_DigitPortDM2],~LED7SEG_DigitMask

   pop   X

IF (LED7SEG_TIMER_PRESENT)
   or    reg[LED7SEG_CONTROL_REG],  LED7SEG_CONTROL_REG_START_BIT
   M8C_EnableIntMask LED7SEG_INT_REG, LED7SEG_INT_MASK
ENDIF

   RAM_EPILOGUE RAM_USE_CLASS_4
   RAM_EPILOGUE RAM_USE_CLASS_3
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_Stop(void)
;
;  DESCRIPTION:
;     Stops scanning and turn off all digits
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    none
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_LED7SEG_Stop:
 LED7SEG_Stop:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >LED7SEG_VarPage

   push A
   ; Turn off scan
   mov   [LED7SEG_ScanStatus],0x00 

   ; Turn off all digits
IF(1)                                            ; Active High Digit Drive
   and  [Port_4_Data_SHADE],~LED7SEG_DigitMask
ELSE                                             ; Active Low Digit Drive
   or   [Port_4_Data_SHADE],LED7SEG_DigitMask
ENDIF
   mov  A,[Port_4_Data_SHADE]    
   mov  reg[LED7SEG_DigitPortDR],A
   pop  A

IF (LED7SEG_TIMER_PRESENT)
   M8C_DisableIntMask LED7SEG_INT_REG, LED7SEG_INT_MASK
   and   reg[LED7SEG_CONTROL_REG], ~LED7SEG_CONTROL_REG_START_BIT
ENDIF

   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION



.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_Dim(Byte bDim)
;
;  DESCRIPTION:
;     Init state machine and clear buffer memory
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    A => bDim   ( Dim Off = 0,  Dim On = 1)
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_LED7SEG_Dim:
 LED7SEG_Dim:
  
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_SETPAGE_CUR >LED7SEG_VarPage

   and    A,0x01
   jz     .DimOff

.DimOn:
   or     [LED7SEG_ScanStatus],LED7SEG_DimEnable
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret

.DimOff:
   and    [LED7SEG_ScanStatus],~LED7SEG_DimEnable
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret

.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_Update(void)
;
;  DESCRIPTION:
;     Advance and display next digit from array.  This function is designed
;     to be called from an ISR, although it could be called in the mainline
;     of your program.
;
;     To call this function from a non Large Memory Model (LMM) device,
;     in an ISR use the following.
;
;     lcall LED7SEG_Update
;
;     If using a LMM part, and calling from an ISR, make sure the processor
;     is either in page mode 0, or in native page mode.  
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    none
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;  How It Works:
;    *  Check if Scan is on
;    *  Blank display, Turn off common drive
;    *  Load Segment register
;    *  Set proper digit, (Turn on common drive)
;    *  Adance counter to next digit
;-----------------------------------------------------------------------------
_LED7SEG_Update:
 LED7SEG_Update:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_3

   push  A
   push  X
   IF (SYSTEM_LARGE_MEMORY_MODEL)
      REG_PRESERVE IDX_PP
      REG_PRESERVE CUR_PP
   ENDIF

   RAM_SETPAGE_IDX >LED7SEG_VarPage
   RAM_SETPAGE_CUR >LED7SEG_VarPage

   tst   [LED7SEG_ScanStatus],LED7SEG_ScanFlag  // Test if scanning is enabled
   jz    .Update_End

   ; Turn off display briefly
IF(1)                                            ; Active High Digit Drive
   and  [Port_4_Data_SHADE],~LED7SEG_DigitMask
ELSE                                             ; Active Low Digit Drive
   or   [Port_4_Data_SHADE],LED7SEG_DigitMask
ENDIF
   mov   A,[Port_4_Data_SHADE]    
   mov   reg[LED7SEG_DigitPortDR],A

   ; Get the segment value, and write it to the segment port
   mov   A,[LED7SEG_ScanStatus]
   and   A,LED7SEG_CntMask                       ; Mask off all but scan position
   swap  A,X

   ; Check for Dim flag
   tst   [LED7SEG_ScanStatus],LED7SEG_DimFlag    ; If set skip update
   jnz   .IncDigit

   mov   A,[X+LED7SEG_DigitRAM]

; Invert here if Active Low segment drive
IF(1)                                            ; Active Low Segment Drive
   ; Do nothing
ELSE
   cpl   A
ENDIF
   mov   reg[LED7SEG_SegmentPortDR],A

   ; Turn digit back on

   mov   A,X                                     ; Copy index into A
   index LED7SEG_DigitPortMask                   ; Digit mask into A

IF(1)                                            ; Active High Digit Drive
   or   [Port_4_Data_SHADE],A
ELSE                                             ; Active Low Digit Drive
   and  [Port_4_Data_SHADE],A
ENDIF
   mov  A,[Port_4_Data_SHADE]
   mov  reg[LED7SEG_DigitPortDR],A


   ; Calculate next digit
.IncDigit:
   swap  A,X                                     ; Put current digit into A
   inc   A                                       ; Advance to next
   inc   [LED7SEG_ScanStatus]
   sub   A,LED7SEG_DigitCnt
   jz    .Reset_Count
   jnc   .Reset_Count
   jmp   .Update_End

.Reset_Count:
   and   [LED7SEG_ScanStatus],~LED7SEG_CntMask   ; Reset count to zero  
   tst   [LED7SEG_ScanStatus],LED7SEG_DimEnable  ; If set skip update
   jz    .Update_End_DimOff
   xor   [LED7SEG_ScanStatus],LED7SEG_DimFlag   
   jmp   .Update_End

.Update_End_DimOff:                              ; Make sure Dim is off
   and   [LED7SEG_ScanStatus],~LED7SEG_DimFlag   ; Make sure dim flag off

.Update_End:
   IF (SYSTEM_LARGE_MEMORY_MODEL)  
      REG_RESTORE CUR_PP
      REG_RESTORE IDX_PP
   ENDIF

   pop   X
   pop   A
.Update_Exit:

   RAM_EPILOGUE RAM_USE_CLASS_3
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_PutHex(BYTE bValue, BYTE bDigit)
;
;  DESCRIPTION:
;     Write hex value to one of the digits
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    A => Value to display
;    X => Digit to update  ( 1 to n )
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_LED7SEG_PutHex:
 LED7SEG_PutHex:
   RAM_PROLOGUE RAM_USE_CLASS_3  
   RAM_SETPAGE_IDX >LED7SEG_VarPage
  
   index   LED7SEG_HexSegMask                    ; Get code
   dec     X                                     ; Dec to shift from (1 to N) to (0 to N-1)
   swap    A,X                                   ; Code in X, index in A
   cmp     A,(LED7SEG_DigitCnt)
   jnc     .putHex_End

   swap    A,X                                   ; Code in A, index in X
   and     [X+LED7SEG_DigitRAM],0x80
   or      [X+LED7SEG_DigitRAM],A
.putHex_End:
   RAM_EPILOGUE RAM_USE_CLASS_3
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_PutPattern(BYTE bPattern, BYTE bDigit)
;
;  DESCRIPTION:
;     Write pattern to 7 segment display
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    A => Pattern to display
;    X => Digit to update  ( 1 to n )
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_LED7SEG_PutPattern:
 LED7SEG_PutPattern:
   RAM_PROLOGUE RAM_USE_CLASS_3  
   RAM_SETPAGE_IDX >LED7SEG_VarPage
  
   dec     X                                     ; Dec to shift from (1 to N) to (0 to N-1)
   swap    A,X                                   ; Code in X, index in A
   cmp     A,(LED7SEG_DigitCnt)
   jnc     .putPat_End

   swap    A,X                                   ; Code in A, index in X
   mov     [X+LED7SEG_DigitRAM],A
.putPat_End:
   RAM_EPILOGUE RAM_USE_CLASS_3
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_DP(BYTE bDpOnOff, BYTE bDigit)
;
;  DESCRIPTION:
;     Set the decimal point with the given mask.
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;    A => DP ON/OFF (0 = DP Off, 1 = DP On)
;    X => Digit  (1 to N)
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_LED7SEG_DP:
 LED7SEG_DP:
   RAM_PROLOGUE RAM_USE_CLASS_3  
   RAM_SETPAGE_IDX >LED7SEG_VarPage
   dec    X                                      ; noramlize from 1 - N, to 0 to N-1
   swap   A,X
   cmp    A,(LED7SEG_DigitCnt)
   jnc    .DP_End
   
   swap   A,X
   cmp    A,0x00                                 ; Is flag set
   jz     .DPOff

   or     [X+LED7SEG_DigitRAM],0x80              ; Set DP
   jmp    .DP_End
.DPOff:
   and    [X+LED7SEG_DigitRAM],0x7F              ; Clear DP

.DP_End:
   RAM_EPILOGUE RAM_USE_CLASS_3
   ret
.ENDSECTION


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: LED7SEG_DispInt(int iValue, BYTE bPos, BYTE bLSD)
;
;  DESCRIPTION:
;     Display integer on 7-Segment display
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:
;          [SP-3] => iValue[7:0]   Value to convert
;          [SP-4] => iValue[15:8]  
;          [SP-5] => bPos[7:0]     Digit starting position
;          [SP-6] => bLSD[7:0]     Digits to display
;
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
;
DI_ValueLSB:   equ   -3
DI_ValueMSB:   equ   -4
DI_POS:        equ   -5
DI_LSD:        equ   -6
DI_DECPTR:     equ    0
DI_RESULT:     equ    1
DI_TMP:        equ    2
DI_STACKSIZE:  equ    3

_LED7SEG_DispInt:
 LED7SEG_DispInt:
   RAM_PROLOGUE RAM_USE_CLASS_2
   
   mov   X,SP                                    ; Get copy of the stack pointer
   add   SP,DI_STACKSIZE                         ; Make some extra room for vars

   ; Testing only
   mov   A,[X+DI_ValueMSB]
   mov   A,[X+DI_ValueLSB]
   mov   A,[X+DI_POS]
   dec   [X+DI_LSD]                              ; shift count from [1 to N] to [0 to N-1]

   mov   [X+DI_DECPTR],4                         ; Load dec ptr with 10000 value


   ; Comapare input value to decade
.DEC_LOOP_TOP:
   mov   [X+DI_RESULT],0                         ; Reset result
.DEC_LOOP:
   ; Compare MSB
   mov   A,[X+DI_DECPTR]
   asl   A                                       ; Index it for 2 (word) bytes ber value
   index DEC_TABLE
   cmp   A,[X+DI_ValueMSB]                       ; Is 10^x > Value  (10^x - value)
   jc    .DO_INC_SUB                             ; If value is still bigger, increment and subtract
   jnz   .TRY_NEXT_DEC

   ; Compare LSB only if MSB values were equal
   mov   A,[X+DI_DECPTR]                         ; Get LSB of DEC value
   asl   A                                       ; Index it for 2 bytes per value
   inc   A                                       ; Advance to LSB value
   index DEC_TABLE
   cmp   A,[X+DI_ValueLSB]                       ; Is 10^x > Value  (10^x - value)
   jc    .DO_INC_SUB                             ; If value is still bigger, increment and subtract
   jnz   .TRY_NEXT_DEC
                                                 ; If it fell through, they are equal
.DO_INC_SUB:
   inc   [X+DI_RESULT]                           ; Increment the result counter
   ; Subtract DEC value from Value
   mov   A,[X+DI_DECPTR]
   asl   A                                       ; Index it for 2 bytes per value
   index DEC_TABLE
   mov   [X+DI_TMP],A                            ; Store this value for a moment  

   mov   A,[X+DI_DECPTR]                         ; Get LSB of DEC value
   asl   A                                       ; Index it for 2 bytes per value
   inc   A                                       ; Advance to LSB value
   index DEC_TABLE
   sub   [X+DI_ValueLSB],A                       ; Is 10^x > Value  (10^x - value)
   mov   A,[X+DI_TMP]
   sbb   [X+DI_ValueMSB],A
   jmp   .DEC_LOOP                               ; Keep subtracting until less than.
   
.TRY_NEXT_DEC:                                   ; Completed last decade

   mov   A,[X+DI_LSD]                            ; Get first position
   cmp   A,[X+DI_DECPTR]      
   jc    .SkipPrint                              ; Not ready skip the print


   ; Figure if digit should be displayed
   mov   A,[X+DI_RESULT]                         ; Get result
   push  X
   mov   X,[X+DI_POS]                            ; Load Position

   RAM_EPILOGUE RAM_USE_CLASS_2
   call  LED7SEG_PutHex
   RAM_PROLOGUE RAM_USE_CLASS_2                  ; Restore system to class 2 memory mode
   pop   X
   inc   [X+DI_POS]                              ; Next time print to the right

.SkipPrint:
   mov   [X+DI_RESULT],0
   dec   [X+DI_DECPTR]
   jnz   .DEC_LOOP

   mov   A,[X+DI_ValueLSB]                       ; Is 10^x > Value  (10^x - value)
   mov   X,[X+DI_POS]                            ; Load Position

   RAM_EPILOGUE RAM_USE_CLASS_2
   call  LED7SEG_PutHex
   RAM_PROLOGUE RAM_USE_CLASS_2                  ; Restore system to class 2 memory mode

.DispInt_End:
   add   SP,-DI_STACKSIZE                        ; Restore stack
   RAM_EPILOGUE RAM_USE_CLASS_2
   ret
.ENDSECTION