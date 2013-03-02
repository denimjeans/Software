Project:      output/SPI
Build Number: 0
Date:         Sat Feb 04 23:45:51 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   0097 =    151. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0159  LoadConfigTBL_spi_Bank0
       01AC  LoadConfigTBL_spi_Bank1
       01E7  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   01E7   0002 =      2. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01E7  __idata_start
       01E9  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01E9   012C =    300. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       01E9  LoadConfigTBL_spi_Ordered
       02AE  LoadConfigInit
       02AE  _LoadConfigInit
       02BE  LoadConfig_spi
       02BE  _LoadConfig_spi
       0315  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0315   0448 =   1096. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0315  _Timer16_ISR
       0319  Timer16_EnableInt
       0319  _Timer16_EnableInt
       031D  _Timer16_DisableInt
       031D  Timer16_DisableInt
       0321  Timer16_Start
       0321  _Timer16_Start
       0325  _Timer16_Stop
       0325  Timer16_Stop
       0329  Timer16_WritePeriod
       0329  _Timer16_WritePeriod
       032F  Timer16_WriteCompareValue
       032F  _Timer16_WriteCompareValue
       0335  Timer16_wReadCompareValue
       0335  _Timer16_wReadCompareValue
       0335  _wTimer16_ReadCompareValue
       0335  wTimer16_ReadCompareValue
       033B  Timer16_wReadTimerSaveCV
       033B  _Timer16_wReadTimerSaveCV
       033B  wTimer16_ReadTimerSaveCV
       033B  _wTimer16_ReadCounter
       033B  wTimer16_ReadCounter
       033B  _wTimer16_ReadTimerSaveCV
       036D  _wTimer16_CaptureCounter
       036D  _wTimer16_ReadTimer
       036D  wTimer16_CaptureCounter
       036D  wTimer16_ReadTimer
       036D  Timer16_wReadTimer
       036D  _Timer16_wReadTimer
       0375  _SPIM_ISR
       0376  _SPIM_EnableInt
       0376  SPIM_EnableInt
       037A  _SPIM_DisableInt
       037A  SPIM_DisableInt
       037E  SPIM_Start
       037E  _SPIM_Start
       0383  SPIM_Stop
       0383  _SPIM_Stop
       0387  SPIM_SendTxData
       0387  _SPIM_SendTxData
       038A  bSPIM_ReadRxData
       038A  _SPIM_bReadRxData
       038A  _bSPIM_ReadRxData
       038A  SPIM_bReadRxData
       038D  SPIM_bReadStatus
       038D  _bSPIM_ReadStatus
       038D  bSPIM_ReadStatus
       038D  _SPIM_bReadStatus
       0390  _PGA_SetPower
       0390  _PGA_Start
       0390  PGA_Start
       0390  PGA_SetPower
       039E  PGA_SetGain
       039E  _PGA_SetGain
       03C0  _PGA_Stop
       03C0  PGA_Stop
       03C4  _LCD_PrCString
       03C4  LCD_PrCString
       03D6  LCD_HEX_STR
       03E6  LCD_PrHexByte
       03E6  _LCD_PrHexByte
       03F9  _LCD_PrHexInt
       03F9  LCD_PrHexInt
       0400  _LCD_PrString
       0400  LCD_PrString
       040A  LCD_Write_Data
       040A  LCD_WriteData
       040A  _LCD_Write_Data
       040A  _LCD_WriteData
       041E  _LCD_Control
       041E  LCD_Control
       04C5  LCD_Start
       04C5  _LCD_Init
       04C5  LCD_Init
       04C5  _LCD_Start
       0531  LCD_ROW_OFFSET
       0535  LCD_Position
       0535  _LCD_Position
       0541  LCD_Delay50uTimes
       0541  _LCD_Delay50uTimes
       0547  LCD_Delay50u_Table
       054F  LCD_Delay50u
       054F  _LCD_Delay50u
       0563  LCD_DrawBG
       0589  _LCD_DrawBG
       05B2  LCD_DrawVBG
       05DF  _LCD_DrawVBG
       060F  _LCD_InitVBG
       060F  LCD_InitVBG
       063C  LCD_BG_TYPE1
       0643  LCD_BG_TYPE2
       064A  _LCD_InitBG
       064A  LCD_InitBG
       067A  _ADCINC_ADConversion_ISR
       06E6  _ADCINC_Start
       06E6  ADCINC_Start
       06F8  _ADCINC_SetPower
       06F8  ADCINC_SetPower
       0706  _ADCINC_Stop
       0706  ADCINC_Stop
       0710  _ADCINC_GetSamples
       0710  ADCINC_GetSamples
       072C  _ADCINC_StopADC
       072C  ADCINC_StopADC
       0736  ADCINC_fIsDataAvailable
       0736  _ADCINC_fIsDataAvailable
       0739  _ADCINC_iClearFlagGetData
       0739  _ADCINC_wClearFlagGetData
       0739  ADCINC_wClearFlagGetData
       0739  ADCINC_iClearFlagGetData
       0746  ADCINC_cClearFlagGetData
       0746  _ADCINC_cClearFlagGetData
       0746  _ADCINC_bClearFlagGetData
       0746  ADCINC_bClearFlagGetData
       074C  _ADCINC_wGetData
       074C  ADCINC_wGetData
       074C  _ADCINC_iGetData
       074C  ADCINC_iGetData
       0751  ADCINC_bGetData
       0751  _ADCINC_bGetData
       0751  ADCINC_cGetData
       0751  _ADCINC_cGetData
       0754  ADCINC_fClearFlag
       0754  _ADCINC_fClearFlag
       075A  ADCINC_WritePulseWidth
       075A  _ADCINC_WritePulseWidth
       075D  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   075D   00F3 =    243. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       075D  __text_start
       075D  _main
       07B5  _Sample
       07C6  _SPI_Send
       07E4  _Timer16
       0850  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _ADWandler
       0000  __data_start
       0001  _SPI
       0002  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0002   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  __rZ
       0003  __rY
       0004  __rX
       0005  __r11
       0006  __r10
       0007  __r9
       0008  __r8
       0009  __r7
       000A  __r6
       000B  __r5
       000C  __r4
       000D  __r3
       000E  __r2
       000F  __r1
       0010  __r0
       0011  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0011   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0011  Port_4_Data_SHADE
       0011  _NO_SHADOW
       0011  NO_SHADOW
       0011  _Port_4_Data_SHADE
       0012  Port_4_DriveMode_0_SHADE
       0012  _Port_4_DriveMode_0_SHADE
       0013  Port_4_DriveMode_1_SHADE
       0013  _Port_4_DriveMode_1_SHADE
       0014  _ADCINC_iResult
       0014  ADCINC_iResult
       0018  ADCINC_fStatus
       0018  _ADCINC_fStatus
       0019  _ADCINC_bState
       0019  ADCINC_bState
       001A  ADCINC_fMode
       001A  _ADCINC_fMode
       001B  ADCINC_bNumSamples
       001B  _ADCINC_bNumSamples
       001C  __ramareas_end
       001C  __InterruptRAM_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   00DA =    218. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       00D7  _bGetPowerSetting
       00D7  bGetPowerSetting

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ timer16int.asm, timer16.asm, spimint.asm, spim.asm, psocconfigtbl.asm, psocconfig.asm, pga.asm ]
[ lcd.asm, adcincint.asm, adcinc.asm, rZ.asm, rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm ]
[ r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x150.0x3fff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

