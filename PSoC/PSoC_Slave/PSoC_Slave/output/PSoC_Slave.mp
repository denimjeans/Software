Project:      output/PSoC_Slave
Build Number: 0
Date:         Wed Feb 13 23:43:44 2013
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   006A =    106. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0150  LoadConfigTBL_psoc_slave_Bank0
       0187  LoadConfigTBL_psoc_slave_Bank1
       01BA  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01BA   00A3 =    163. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       01BA  LoadConfigTBL_psoc_slave_Ordered
       01FF  _LoadConfigInit
       01FF  LoadConfigInit
       0206  _LoadConfig_psoc_slave
       0206  LoadConfig_psoc_slave
       025D  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   025D   0423 =   1059. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       025D  _PWM16_ISR
       025E  _PWM16_EnableInt
       025E  PWM16_EnableInt
       0262  PWM16_DisableInt
       0262  _PWM16_DisableInt
       0266  PWM16_Start
       0266  _PWM16_Start
       026A  PWM16_Stop
       026A  _PWM16_Stop
       026E  PWM16_WritePeriod
       026E  _PWM16_WritePeriod
       0274  PWM16_WritePulseWidth
       0274  _PWM16_WritePulseWidth
       027A  wPWM16_ReadPulseWidth
       027A  _PWM16_wReadPulseWidth
       027A  PWM16_wReadPulseWidth
       027A  _wPWM16_ReadPulseWidth
       0280  _wPWM16_ReadCounter
       0280  wPWM16_ReadCounter
       0280  _PWM16_wReadCounter
       0280  PWM16_wReadCounter
       02B6  _EzI2Cs_ISR
       0382  EzI2Cs_Start
       0382  _EzI2Cs_Start
       03B0  EzI2Cs_GetActivity
       03B0  _EzI2Cs_GetActivity
       03B8  EzI2Cs_GetAddr
       03B8  _EzI2Cs_GetAddr
       03BB  _EzI2Cs_ResumeInt
       03BB  EzI2Cs_ResumeInt
       03BD  _EzI2Cs_EnableInt
       03BD  EzI2Cs_EnableInt
       03C8  _EzI2Cs_Stop
       03C8  EzI2Cs_Stop
       03CF  _EzI2Cs_DisableInt
       03CF  EzI2Cs_DisableInt
       03D3  EzI2Cs_DisableSlave
       03D3  _EzI2Cs_DisableSlave
       03D7  EzI2Cs_SetRamBuffer
       03D7  _EzI2Cs_SetRamBuffer
       03E5  _ADC10_ADC_ISR
       0418  _ADC10_CNT_ISR
       041B  _ADC10_Start
       041B  ADC10_Start
       0436  ADC10_Stop
       0436  _ADC10_Stop
       0449  ADC10_StartADC
       0449  _ADC10_StartADC
       0467  ADC10_StopADC
       0467  _ADC10_StopADC
       0474  _ADC10_fIsDataAvailable
       0474  ADC10_fIsDataAvailable
       0477  _ADC10_iGetDataClearFlag
       0477  ADC10_iGetDataClearFlag
       047A  ADC10_iGetData
       047A  _ADC10_iGetData
       0485  _ADC10_ClearFlag
       0485  ADC10_ClearFlag
       0489  _ADC10_iCal
       0489  ADC10_iCal
       0542  _ADC10_StartTempMeasurement
       0542  ADC10_StartTempMeasurement
       0550  ADC10_GetTemperature
       0550  _ADC10_GetTemperature
       0680  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0680   006B =    107. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0680  __text_start
       0680  _main
       06EB  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0000   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __r0
       0001  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0001   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0001  NO_SHADOW
       0001  EzI2Cs_varPage
       0001  _EzI2Cs_bState
       0001  _NO_SHADOW
       0001  _EzI2Cs_varPage
       0001  EzI2Cs_bState
       0002  EzI2Cs_bRAM_RWoffset
       0002  _EzI2Cs_bRAM_RWoffset
       0003  _EzI2Cs_bRAM_RWcntr
       0003  EzI2Cs_bRAM_RWcntr
       0004  _EzI2Cs_pRAM_Buf_Addr_LSB
       0004  EzI2Cs_pRAM_Buf_Addr_LSB
       0005  EzI2Cs_bRAM_Buf_Size
       0005  _EzI2Cs_bRAM_Buf_Size
       0006  EzI2Cs_bRAM_Buf_WSize
       0006  _EzI2Cs_bRAM_Buf_WSize
       0007  EzI2Cs_bBusy_Flag
       0007  _EzI2Cs_bBusy_Flag
       0008  ADC10_bTempMSB
       0009  _ADC10_iResult
       0009  ADC10_iResult
       000B  ADC10_bfStatus
       000B  _ADC10_bfStatus
       000F  __InterruptRAM_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   000F   0007 =      7. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000F  _I2C
       000F  __bss_start
       0016  __ramareas_end
       0016  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   00CE =    206. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       00CB  _bGetPowerSetting
       00CB  bGetPowerSetting

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ pwm16int.asm, pwm16.asm, psocconfigtbl.asm, psocconfig.asm, ezi2csint.asm, ezi2cs.asm, adc10int.asm ]
[ adc10.asm, r0.asm ]

Area Definitions

-blit:0x150.0xfff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

