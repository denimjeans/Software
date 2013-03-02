#ifndef ADC8_INCLUDE
#define ADC8_INCLUDE

#include <m8C.h>

// Function Fastcall Pragmas
#pragma fastcall16  ADC8_Start
#pragma fastcall16  ADC8_Stop
#pragma fastcall16  ADC8_StartADC
#pragma fastcall16  ADC8_StopADC
#pragma fastcall16  ADC8_fIsDataAvailable
#pragma fastcall16  ADC8_bGetData
#pragma fastcall16  ADC8_ClearFlag
#pragma fastcall16  ADC8_bGetDataClearFlag
#pragma fastcall16  ADC8_bCal


//-------------------------------------------------
// API Prototypes.
//-------------------------------------------------
extern void ADC8_Start(BYTE bRange);
extern void ADC8_Stop(void);
extern void ADC8_StartADC(void);
extern void ADC8_StopADC(void);
extern BYTE ADC8_fIsDataAvailable(void);
extern BYTE ADC8_bGetData(void);
extern void ADC8_ClearFlag(void);
extern BYTE ADC8_bGetDataClearFlag(void);
extern BYTE ADC8_bCal(BYTE bVal, BYTE bCalIn);


#define ADC8_LOWRANGE		0x01
#define ADC8_FULLRANGE  	0x03

#define ADC8_CAL_VBG		0x03
#define ADC8_CAL_AMUXBUS 	0x07
#define ADC8_CAL_P0_0		0x10
#define ADC8_CAL_P0_1		0x90
#define ADC8_CAL_P0_2		0x14
#define ADC8_CAL_P0_3		0x91
#define ADC8_CAL_P0_4		0x18
#define ADC8_CAL_P0_5		0x92
#define ADC8_CAL_P0_6		0x1C
#define ADC8_CAL_P0_7		0x93

// Counter Block Register Definitions
#pragma ioport  ADC8_ASE_CR0:   0x080
BYTE            ADC8_ASE_CR0;
#pragma ioport  ADC8_ACE_CR1:   0x072
BYTE            ADC8_ACE_CR1;
#pragma ioport  ADC8_ACE_CR2:   0x073
BYTE            ADC8_ACE_CR2;
#pragma ioport  ADC8_ADC_CR:    0x068
BYTE            ADC8_ADC_CR;
#pragma ioport  ADC8_ADC_TR:    0x1e5
BYTE            ADC8_ADC_TR;
 
// Counter Block Register Definitions
#pragma ioport  ADC8_CNT_FN:    0x120
BYTE            ADC8_CNT_FN;
#pragma ioport  ADC8_CNT_IN:    0x121
BYTE            ADC8_CNT_IN;
#pragma ioport  ADC8_CNT_OUT:   0x122
BYTE            ADC8_CNT_OUT;
#pragma ioport  ADC8_CNT_DR0:   0x020
BYTE            ADC8_CNT_DR0;
#pragma ioport  ADC8_CNT_DR1:   0x021
BYTE            ADC8_CNT_DR1;
#pragma ioport  ADC8_CNT_DR2:   0x022
BYTE            ADC8_CNT_DR2;
#pragma ioport  ADC8_CNT_CR0:   0x023
BYTE            ADC8_CNT_CR0;
   
#endif
