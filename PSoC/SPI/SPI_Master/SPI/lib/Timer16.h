//*****************************************************************************
//*****************************************************************************
//  FILENAME: Timer16.h
//   Version: 2.6, Updated on 2011/12/1 at 17:23:24
//  Generated by PSoC Designer 5.2.2401
//
//  DESCRIPTION: Timer16 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2011. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef Timer16_INCLUDE
#define Timer16_INCLUDE

#include <m8c.h>

#pragma fastcall16 Timer16_EnableInt
#pragma fastcall16 Timer16_DisableInt
#pragma fastcall16 Timer16_Start
#pragma fastcall16 Timer16_Stop
#pragma fastcall16 Timer16_wReadTimer                // Read  DR0
#pragma fastcall16 Timer16_wReadTimerSaveCV          // Read  DR0      
#pragma fastcall16 Timer16_WritePeriod               // Write DR1
#pragma fastcall16 Timer16_wReadCompareValue         // Read  DR2
#pragma fastcall16 Timer16_WriteCompareValue         // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 wTimer16_ReadCounter              // Read  DR0 "Obsolete"
#pragma fastcall16 wTimer16_CaptureCounter           // Read  DR0 "Obsolete"
#pragma fastcall16 wTimer16_ReadTimer                // Read  DR0 (Deprecated)
#pragma fastcall16 wTimer16_ReadTimerSaveCV          // Read  DR0 (Deprecated)
#pragma fastcall16 wTimer16_ReadCompareValue         // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the Timer16 API.
//-------------------------------------------------

extern void Timer16_EnableInt(void);                           // Proxy 1
extern void Timer16_DisableInt(void);                          // Proxy 1
extern void Timer16_Start(void);                               // Proxy 1
extern void Timer16_Stop(void);                                // Proxy 1
extern WORD Timer16_wReadTimer(void);                          // Proxy 1
extern WORD Timer16_wReadTimerSaveCV(void);                    // Proxy 2
extern void Timer16_WritePeriod(WORD wPeriod);                 // Proxy 1
extern WORD Timer16_wReadCompareValue(void);                   // Proxy 1
extern void Timer16_WriteCompareValue(WORD wCompareValue);     // Proxy 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern WORD wTimer16_ReadCompareValue(void);       // Deprecated
extern WORD wTimer16_ReadTimerSaveCV(void);        // Deprecated
extern WORD wTimer16_ReadCounter(void);            // Obsolete
extern WORD wTimer16_ReadTimer(void);              // Deprecated
extern WORD wTimer16_CaptureCounter(void);         // Obsolete


//--------------------------------------------------
// Constants for Timer16 API's.
//--------------------------------------------------

#define Timer16_CONTROL_REG_START_BIT          ( 0x01 )
#define Timer16_INT_REG_ADDR                   ( 0x0e1 )
#define Timer16_INT_MASK                       ( 0x10 )


//--------------------------------------------------
// Constants for Timer16 user defined values
//--------------------------------------------------

#define Timer16_PERIOD                         ( 0x8000 )
#define Timer16_COMPARE_VALUE                  ( 0x0 )


//-------------------------------------------------
// Register Addresses for Timer16
//-------------------------------------------------

#pragma ioport  Timer16_COUNTER_LSB_REG:    0x02c          //Count register LSB
BYTE            Timer16_COUNTER_LSB_REG;
#pragma ioport  Timer16_COUNTER_MSB_REG:    0x030          //Count register MSB
BYTE            Timer16_COUNTER_MSB_REG;
#pragma ioport  Timer16_PERIOD_LSB_REG: 0x02d              //Period register LSB
BYTE            Timer16_PERIOD_LSB_REG;
#pragma ioport  Timer16_PERIOD_MSB_REG: 0x031              //Period register MSB
BYTE            Timer16_PERIOD_MSB_REG;
#pragma ioport  Timer16_COMPARE_LSB_REG:    0x02e          //Compare register LSB
BYTE            Timer16_COMPARE_LSB_REG;
#pragma ioport  Timer16_COMPARE_MSB_REG:    0x032          //Compare register MSB
BYTE            Timer16_COMPARE_MSB_REG;
#pragma ioport  Timer16_CONTROL_LSB_REG:    0x02f          //Control register LSB
BYTE            Timer16_CONTROL_LSB_REG;
#pragma ioport  Timer16_CONTROL_MSB_REG:    0x033          //Control register MSB
BYTE            Timer16_CONTROL_MSB_REG;
#pragma ioport  Timer16_FUNC_LSB_REG:   0x12c              //Function register LSB
BYTE            Timer16_FUNC_LSB_REG;
#pragma ioport  Timer16_FUNC_MSB_REG:   0x130              //Function register MSB
BYTE            Timer16_FUNC_MSB_REG;
#pragma ioport  Timer16_INPUT_LSB_REG:  0x12d              //Input register LSB
BYTE            Timer16_INPUT_LSB_REG;
#pragma ioport  Timer16_INPUT_MSB_REG:  0x131              //Input register MSB
BYTE            Timer16_INPUT_MSB_REG;
#pragma ioport  Timer16_OUTPUT_LSB_REG: 0x12e              //Output register LSB
BYTE            Timer16_OUTPUT_LSB_REG;
#pragma ioport  Timer16_OUTPUT_MSB_REG: 0x132              //Output register MSB
BYTE            Timer16_OUTPUT_MSB_REG;
#pragma ioport  Timer16_INT_REG:       0x0e1               //Interrupt Mask Register
BYTE            Timer16_INT_REG;


//-------------------------------------------------
// Timer16 Macro 'Functions'
//-------------------------------------------------

#define Timer16_Start_M \
   ( Timer16_CONTROL_LSB_REG |=  Timer16_CONTROL_REG_START_BIT )

#define Timer16_Stop_M  \
   ( Timer16_CONTROL_LSB_REG &= ~Timer16_CONTROL_REG_START_BIT )

#define Timer16_EnableInt_M   \
   M8C_EnableIntMask(  Timer16_INT_REG, Timer16_INT_MASK )

#define Timer16_DisableInt_M  \
   M8C_DisableIntMask( Timer16_INT_REG, Timer16_INT_MASK )

#endif
// end of file Timer16.h