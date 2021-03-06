;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: CSDINT.asm
;;  Version: 1.70, Updated on 2012/3/2 at 9:13:13
;;  Generated by PSoC Designer ver 4.3  b1884 : 29 July, 2006
;;
;;  DESCRIPTION: CSD User Module ISR implementation file.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------

export _CSD_CNT_ISR
export _CSD_CMP_ISR
export _CSD_CMP0_ISR

AREA InterruptRAM (RAM,REL,CON)

;@PSoC_UserCode_INIT@ (Do not change this line.)
;---------------------------------------------------
; Insert your custom declarations below this banner
;---------------------------------------------------

;------------------------
; Includes
;------------------------


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
;  FUNCTION NAME: _CSD_CNT_ISR
;
;  DESCRIPTION:
;
;-----------------------------------------------------------------------------
;

_CSD_CNT_ISR:

   inc    [CSD_wADC_Result];

   ;@PSoC_UserCode_BODY_3@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti


;-----------------------------------------------------------------------------
;  FUNCTION NAME: CSD_CMP_ISR
;
;  DESCRIPTION:
;  Interrupt Service Routine for the Analog Column.  If the interrupt is
;  enabled and the comparator trips the code execution will vector to this
;  ISR.
;
;-----------------------------------------------------------------------------
;
;


_CSD_CMP_ISR:


   ;@PSoC_UserCode_BODY_2@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti


;-----------------------------------------------------------------------------
;  FUNCTION NAME: _CSD_PRSH_ISR
;
;  DESCRIPTION: Unless modified, this implements only a null handler stub.
;
;-----------------------------------------------------------------------------
;

_CSD_PRSH_ISR:

   ;@PSoC_UserCode_BODY_6@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

;-----------------------------------------------------------------------------
;  FUNCTION NAME: _CSD_CMP0_ISR
;
;  DESCRIPTION: Dedicated PWM interruot handler
;
;-----------------------------------------------------------------------------
;
_CSD_CMP0_ISR:

   and    reg[PWM_CR],~01h              ; Stop dedicated PWM

   M8C_DisableIntMask 0xE1, 0x01        ; Disable counter interrupt

   tst    reg[INT_CLR1],INT_MSK1_DBB00
   jz     .NoPendingInterrupt           ; Make sure counter has been serviced
   inc    [CSD_wADC_Result];
   mov    reg[INT_CLR1],~(INT_MSK1_DBB00); Clear pending interrupt

.NoPendingInterrupt:
   push   A
; Read Counter
   mov    A, reg[DBB00DR0]
   mov    A, reg[DBB00DR2]
   cpl    A
   mov    [CSD_wADC_Result+1], A

.Done:
   mov    [CSD_bADCStatus], 01h
   pop    A

   ;@PSoC_UserCode_BODY_4@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom assembly code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.
   
   ;---------------------------------------------------
   ; Insert your custom assembly code above this banner
   ;---------------------------------------------------
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function below this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   
   ;PRESERVE_CPU_CONTEXT
   ;lcall _My_C_Function
   ;RESTORE_CPU_CONTEXT
   
   ;---------------------------------------------------
   ; Insert a lcall to a C function above this banner
   ; and un-comment the lines between these banners
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

; end of file CSDINT.asm
