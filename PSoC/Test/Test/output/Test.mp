Project:      output/Test
Build Number: 0
Date:         Wed Feb 13 18:25:28 2013
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   008C =    140. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_test_Bank0
       01FB  LoadConfigTBL_test_Bank1
       022C  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   022C   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       022C  __func_lit_start
       022E  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   022E   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       022E  LoadConfigTBL_test_Ordered
       0333  LoadConfigInit
       0333  _LoadConfigInit
       0343  LoadConfig_test
       0343  _LoadConfig_test
       039E  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   039E   0443 =   1091. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       039E  _PWM16_ISR
       039F  _PWM16_EnableInt
       039F  PWM16_EnableInt
       03A3  _PWM16_DisableInt
       03A3  PWM16_DisableInt
       03A7  PWM16_Start
       03A7  _PWM16_Start
       03AB  PWM16_Stop
       03AB  _PWM16_Stop
       03AF  PWM16_WritePeriod
       03AF  _PWM16_WritePeriod
       03B5  _PWM16_WritePulseWidth
       03B5  PWM16_WritePulseWidth
       03BB  PWM16_wReadPulseWidth
       03BB  _wPWM16_ReadPulseWidth
       03BB  _PWM16_wReadPulseWidth
       03BB  wPWM16_ReadPulseWidth
       03C1  PWM16_wReadCounter
       03C1  _wPWM16_ReadCounter
       03C1  _PWM16_wReadCounter
       03C1  wPWM16_ReadCounter
       03FB  _LCD_PrCString
       03FB  LCD_PrCString
       040D  LCD_HEX_STR
       041D  LCD_PrHexByte
       041D  _LCD_PrHexByte
       0430  _LCD_PrHexInt
       0430  LCD_PrHexInt
       0437  LCD_PrString
       0437  _LCD_PrString
       0449  _LCD_WriteData
       0449  LCD_Write_Data
       0449  _LCD_Write_Data
       0449  LCD_WriteData
       045D  _LCD_Control
       045D  LCD_Control
       050D  _LCD_Init
       050D  _LCD_Start
       050D  LCD_Init
       050D  LCD_Start
       057C  LCD_ROW_OFFSET
       0580  _LCD_Position
       0580  LCD_Position
       0590  LCD_Delay50uTimes
       0590  _LCD_Delay50uTimes
       0596  LCD_Delay50u_Table
       059E  _LCD_Delay50u
       059E  LCD_Delay50u
       05B2  _LCD_DrawBG
       05E3  _LCD_DrawVBG
       0617  _LCD_InitVBG
       0617  LCD_InitVBG
       0648  LCD_BG_TYPE1
       064F  LCD_BG_TYPE2
       0656  LCD_InitBG
       0656  _LCD_InitBG
       068A  _EzI2Cs_ISR
       076D  _EzI2Cs_Start
       076D  EzI2Cs_Start
       079E  _EzI2Cs_GetActivity
       079E  EzI2Cs_GetActivity
       07A9  _EzI2Cs_GetAddr
       07A9  EzI2Cs_GetAddr
       07AC  EzI2Cs_ResumeInt
       07AC  _EzI2Cs_ResumeInt
       07AE  _EzI2Cs_EnableInt
       07AE  EzI2Cs_EnableInt
       07B9  EzI2Cs_Stop
       07B9  _EzI2Cs_Stop
       07C0  EzI2Cs_DisableInt
       07C0  _EzI2Cs_DisableInt
       07C4  _EzI2Cs_DisableSlave
       07C4  EzI2Cs_DisableSlave
       07C8  EzI2Cs_SetRamBuffer
       07C8  _EzI2Cs_SetRamBuffer
       07E1  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   07E1   008F =    143. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       07E1  __text_start
       07E1  _main
       0870  __xidata_start
       0870  __text_end
       0876  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   0146 =    326. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0143  _bGetPowerSetting
       0143  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _Port_2_Data_SHADE
       0000  _NO_SHADOW
       0000  NO_SHADOW
       0000  Port_2_Data_SHADE
       0001  _Port_2_DriveMode_0_SHADE
       0001  Port_2_DriveMode_0_SHADE
       0002  _Port_2_DriveMode_1_SHADE
       0002  Port_2_DriveMode_1_SHADE
       0003  _EzI2Cs_bState
       0003  EzI2Cs_varPage
       0003  _EzI2Cs_varPage
       0003  EzI2Cs_bState
       0004  EzI2Cs_bRAM_RWoffset
       0004  _EzI2Cs_bRAM_RWoffset
       0005  _EzI2Cs_bRAM_RWcntr
       0005  EzI2Cs_bRAM_RWcntr
       0006  _EzI2Cs_pRAM_Buf_Addr_MSB
       0006  EzI2Cs_pRAM_Buf_Addr_MSB
       0007  _EzI2Cs_pRAM_Buf_Addr_LSB
       0007  EzI2Cs_pRAM_Buf_Addr_LSB
       0008  _EzI2Cs_bRAM_Buf_Size
       0008  EzI2Cs_bRAM_Buf_Size
       0009  _EzI2Cs_bRAM_Buf_WSize
       0009  EzI2Cs_bRAM_Buf_WSize
       000A  EzI2Cs_bBusy_Flag
       000A  _EzI2Cs_bBusy_Flag

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0011   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0011  __r1
       0012  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0006 =      6. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       000B  _I2C

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ pwm16int.asm, pwm16.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, ezi2csint.asm, ezi2cs.asm ]
[ r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x11
-Btest_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

