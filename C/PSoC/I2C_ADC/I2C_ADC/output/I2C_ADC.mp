Project:      output/I2C_ADC
Build Number: 0
Date:         Tue Jan 29 10:38:27 2013
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00AD =    173. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01BD  LoadConfigTBL_i2c_slave_Bank0
       0222  LoadConfigTBL_i2c_slave_Bank1
       024D  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   024D   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       024D  __func_lit_start
       024F  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   024F   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       024F  LoadConfigTBL_i2c_slave_Ordered
       0354  LoadConfigInit
       0354  _LoadConfigInit
       0364  LoadConfig_i2c_slave
       0364  _LoadConfig_i2c_slave
       03BF  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03BF   0535 =   1333. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03BF  PGA_Start
       03BF  _PGA_SetPower
       03BF  PGA_SetPower
       03BF  _PGA_Start
       03D1  _PGA_SetGain
       03D1  PGA_SetGain
       03FB  PGA_Stop
       03FB  _PGA_Stop
       03FF  _LCD_PrCString
       03FF  LCD_PrCString
       0411  LCD_HEX_STR
       0421  _LCD_PrHexByte
       0421  LCD_PrHexByte
       0434  _LCD_PrHexInt
       0434  LCD_PrHexInt
       043B  _LCD_PrString
       043B  LCD_PrString
       044D  _LCD_WriteData
       044D  LCD_Write_Data
       044D  _LCD_Write_Data
       044D  LCD_WriteData
       0461  _LCD_Control
       0461  LCD_Control
       0511  _LCD_Init
       0511  _LCD_Start
       0511  LCD_Start
       0511  LCD_Init
       0580  LCD_ROW_OFFSET
       0584  LCD_Position
       0584  _LCD_Position
       0594  LCD_Delay50uTimes
       0594  _LCD_Delay50uTimes
       059A  LCD_Delay50u_Table
       05A2  _LCD_Delay50u
       05A2  LCD_Delay50u
       05B6  _LCD_DrawBG
       05E7  _LCD_DrawVBG
       061B  LCD_InitVBG
       061B  _LCD_InitVBG
       064C  LCD_BG_TYPE1
       0653  LCD_BG_TYPE2
       065A  LCD_InitBG
       065A  _LCD_InitBG
       068E  _EzI2Cs_ISR
       0771  EzI2Cs_Start
       0771  _EzI2Cs_Start
       07A2  _EzI2Cs_GetActivity
       07A2  EzI2Cs_GetActivity
       07AD  _EzI2Cs_GetAddr
       07AD  EzI2Cs_GetAddr
       07B0  _EzI2Cs_ResumeInt
       07B0  EzI2Cs_ResumeInt
       07B2  _EzI2Cs_EnableInt
       07B2  EzI2Cs_EnableInt
       07BD  EzI2Cs_Stop
       07BD  _EzI2Cs_Stop
       07C4  _EzI2Cs_DisableInt
       07C4  EzI2Cs_DisableInt
       07C8  _EzI2Cs_DisableSlave
       07C8  EzI2Cs_DisableSlave
       07CC  _EzI2Cs_SetRamBuffer
       07CC  EzI2Cs_SetRamBuffer
       07E5  _ADCINC_ADConversion_ISR
       0853  ADCINC_Start
       0853  _ADCINC_Start
       0862  _ADCINC_SetPower
       0862  ADCINC_SetPower
       0874  ADCINC_Stop
       0874  _ADCINC_Stop
       087E  ADCINC_GetSamples
       087E  _ADCINC_GetSamples
       08A7  _ADCINC_StopADC
       08A7  ADCINC_StopADC
       08BB  ADCINC_fIsDataAvailable
       08BB  _ADCINC_fIsDataAvailable
       08C1  _ADCINC_iClearFlagGetData
       08C1  ADCINC_iClearFlagGetData
       08C1  _ADCINC_wClearFlagGetData
       08C1  ADCINC_wClearFlagGetData
       08D1  _ADCINC_bClearFlagGetData
       08D1  _ADCINC_cClearFlagGetData
       08D1  ADCINC_bClearFlagGetData
       08D1  ADCINC_cClearFlagGetData
       08DA  _ADCINC_iGetData
       08DA  ADCINC_iGetData
       08DA  ADCINC_wGetData
       08DA  _ADCINC_wGetData
       08E2  _ADCINC_bGetData
       08E2  ADCINC_bGetData
       08E2  _ADCINC_cGetData
       08E2  ADCINC_cGetData
       08E8  ADCINC_fClearFlag
       08E8  _ADCINC_fClearFlag
       08F1  ADCINC_WritePulseWidth
       08F1  _ADCINC_WritePulseWidth
       08F4  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   08F4   00C5 =    197. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       08F4  __text_start
       08F4  _main
       09B0  _I2C_Init
       09B9  __xidata_start
       09B9  __text_end
       09C4  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   0151 =    337. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       014E  _bGetPowerSetting
       014E  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0013 =     19. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _Port_2_Data_SHADE
       0000  Port_2_Data_SHADE
       0000  _NO_SHADOW
       0000  NO_SHADOW
       0001  Port_2_DriveMode_0_SHADE
       0001  _Port_2_DriveMode_0_SHADE
       0002  _Port_2_DriveMode_1_SHADE
       0002  Port_2_DriveMode_1_SHADE
       0003  EzI2Cs_varPage
       0003  _EzI2Cs_varPage
       0003  EzI2Cs_bState
       0003  _EzI2Cs_bState
       0004  EzI2Cs_bRAM_RWoffset
       0004  _EzI2Cs_bRAM_RWoffset
       0005  EzI2Cs_bRAM_RWcntr
       0005  _EzI2Cs_bRAM_RWcntr
       0006  EzI2Cs_pRAM_Buf_Addr_MSB
       0006  _EzI2Cs_pRAM_Buf_Addr_MSB
       0007  EzI2Cs_pRAM_Buf_Addr_LSB
       0007  _EzI2Cs_pRAM_Buf_Addr_LSB
       0008  _EzI2Cs_bRAM_Buf_Size
       0008  EzI2Cs_bRAM_Buf_Size
       0009  EzI2Cs_bRAM_Buf_WSize
       0009  _EzI2Cs_bRAM_Buf_WSize
       000A  _EzI2Cs_bBusy_Flag
       000A  EzI2Cs_bBusy_Flag
       000B  _ADCINC_iResult
       000B  ADCINC_iResult
       000F  _ADCINC_fStatus
       000F  ADCINC_fStatus
       0010  ADCINC_bState
       0010  _ADCINC_bState
       0011  _ADCINC_fMode
       0011  ADCINC_fMode
       0012  _ADCINC_bNumSamples
       0012  ADCINC_bNumSamples

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0015   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0015  __r1
       0016  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0003 =      3. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0013  _Wert
       0017  _Adresse

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ psocconfigtbl.asm, psocconfig.asm, pga.asm, lcd.asm, ezi2csint.asm, ezi2cs.asm, adcincint.asm ]
[ adcinc.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x15
-Bi2c_slave_RAM
-rwh:SSCParmBlk:0xf7.0xff

