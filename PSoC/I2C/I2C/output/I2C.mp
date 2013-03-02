Project:      output/I2C
Build Number: 0
Date:         Mon Feb 06 22:20:24 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00A8 =    168. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01B0  LoadConfigTBL_I2C_Bank0
       0211  LoadConfigTBL_I2C_Bank1
       0248  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0248   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0248  __func_lit_start
       024A  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   024A   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       024A  LoadConfigTBL_I2C_Ordered
       034F  LoadConfigInit
       034F  _LoadConfigInit
       035F  _LoadConfig_I2C
       035F  LoadConfig_I2C
       03BA  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03BA   06DB =   1755. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03BA  _Timer16_ISR
       03BE  Timer16_EnableInt
       03BE  _Timer16_EnableInt
       03C2  _Timer16_DisableInt
       03C2  Timer16_DisableInt
       03C6  Timer16_Start
       03C6  _Timer16_Start
       03CA  Timer16_Stop
       03CA  _Timer16_Stop
       03CE  _Timer16_WritePeriod
       03CE  Timer16_WritePeriod
       03D4  _Timer16_WriteCompareValue
       03D4  Timer16_WriteCompareValue
       03DA  Timer16_wReadCompareValue
       03DA  wTimer16_ReadCompareValue
       03DA  _wTimer16_ReadCompareValue
       03DA  _Timer16_wReadCompareValue
       03E0  Timer16_wReadTimerSaveCV
       03E0  _wTimer16_ReadCounter
       03E0  wTimer16_ReadTimerSaveCV
       03E0  _Timer16_wReadTimerSaveCV
       03E0  _wTimer16_ReadTimerSaveCV
       03E0  wTimer16_ReadCounter
       0416  wTimer16_ReadTimer
       0416  _wTimer16_CaptureCounter
       0416  _Timer16_wReadTimer
       0416  _wTimer16_ReadTimer
       0416  Timer16_wReadTimer
       0416  wTimer16_CaptureCounter
       041E  _SPIM_ISR
       041F  LCD_PrCString
       041F  _LCD_PrCString
       0431  LCD_HEX_STR
       0441  _LCD_PrHexByte
       0441  LCD_PrHexByte
       0454  _LCD_PrHexInt
       0454  LCD_PrHexInt
       045B  LCD_PrString
       045B  _LCD_PrString
       046D  LCD_WriteData
       046D  LCD_Write_Data
       046D  _LCD_Write_Data
       046D  _LCD_WriteData
       0481  _LCD_Control
       0481  LCD_Control
       0531  _LCD_Init
       0531  LCD_Start
       0531  _LCD_Start
       0531  LCD_Init
       05A0  LCD_ROW_OFFSET
       05A4  LCD_Position
       05A4  _LCD_Position
       05B4  _LCD_Delay50uTimes
       05B4  LCD_Delay50uTimes
       05BA  LCD_Delay50u_Table
       05C2  LCD_Delay50u
       05C2  _LCD_Delay50u
       05D6  _LCD_DrawBG
       0607  _LCD_DrawVBG
       063B  LCD_InitVBG
       063B  _LCD_InitVBG
       066C  LCD_BG_TYPE1
       0673  LCD_BG_TYPE2
       067A  _LCD_InitBG
       067A  LCD_InitBG
       06AE  I2CHW_Start
       06AE  _I2CHW_Start
       06AF  I2CHW_ResumeInt
       06AF  _I2CHW_ResumeInt
       06B2  I2CHW_EnableInt
       06B2  _I2CHW_EnableInt
       06BE  _I2CHW_ClearInt
       06BE  I2CHW_ClearInt
       06C7  _I2CHW_EnableMstr
       06C7  I2CHW_EnableMstr
       06D7  _I2CHW_DisableInt
       06D7  _I2CHW_Stop
       06D7  I2CHW_DisableInt
       06D7  I2CHW_Stop
       06DB  _I2CHW_DisableMstr
       06DB  I2CHW_DisableMstr
       06DF  _I2CHW_fReadBytes
       0723  _I2CHW_bWriteBytes
       0767  _I2CHW_bWriteCBytes
       07D3  _I2CHW_fSendRepeatStart
       07D3  I2CHW_fSendRepeatStart
       080F  I2CHW_fSendStart
       080F  _I2CHW_fSendStart
       0853  I2CHW_fWrite
       0853  _I2CHW_fWrite
       0893  _I2CHW_bRead
       0893  I2CHW_bRead
       08C9  I2CHW_SendStop
       08C9  _I2CHW_SendStop
       08D2  I2CHW_bReadBusStatus
       08D2  _I2CHW_bReadBusStatus
       08D8  _I2CHW_ISR
       0A15  _I2CHW_InitWrite
       0A15  I2CHW_InitWrite
       0A53  _I2CHW_InitRamRead
       0A53  I2CHW_InitRamRead
       0A80  I2CHW_InitFlashRead
       0A80  _I2CHW_InitFlashRead
       0A81  I2CHW_bReadI2CStatus
       0A81  _I2CHW_bReadI2CStatus
       0A87  _I2CHW_ClrRdStatus
       0A87  I2CHW_ClrRdStatus
       0A8E  I2CHW_ClrWrStatus
       0A8E  _I2CHW_ClrWrStatus
       0A95  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0A95   01D4 =    468. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0A95  _main
       0A95  __text_start
       0AE3  _Timer16
       0B6E  _I2C_Init
       0B7A  _Write_PCF
       0BA8  _Read_PCF
       0BD6  _Read_LM75
       0C04  _Read_PSoCSlave
       0C69  __xidata_start
       0C69  __text_end
       0C73  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   016A =    362. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0167  _bGetPowerSetting
       0167  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   000C =     12. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _NO_SHADOW
       0000  Port_2_Data_SHADE
       0000  _Port_2_Data_SHADE
       0000  NO_SHADOW
       0001  Port_2_DriveMode_0_SHADE
       0001  _Port_2_DriveMode_0_SHADE
       0002  _Port_2_DriveMode_1_SHADE
       0002  Port_2_DriveMode_1_SHADE
       0003  _I2CHW_bStatus
       0003  I2CHW_bStatus
       0004  I2CHW_SlaveAddr
       0004  _I2CHW_SlaveAddr
       0005  I2CHW_RsrcStatus
       0005  _I2CHW_RsrcStatus
       0006  _I2CHW_Write_Count
       0006  I2CHW_Write_Count
       0007  _pI2CHW_Write_BufHI
       0007  pI2CHW_Write_BufHI
       0008  pI2CHW_Write_Buf
       0008  pI2CHW_Write_BufLO
       0008  _pI2CHW_Write_BufLO
       0008  _pI2CHW_Write_Buf
       0009  _pI2CHW_Read_BufHI
       0009  pI2CHW_Read_BufHI
       000A  pI2CHW_Read_Buf
       000A  pI2CHW_Read_BufLO
       000A  _pI2CHW_Read_BufLO
       000A  _pI2CHW_Read_Buf
       000B  _I2CHW_Read_Count
       000B  I2CHW_Read_Count

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   000C   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000C  __rZ
       000D  __rY
       000E  __rX
       000F  __r11
       0010  __r10
       0011  __r9
       0012  __r8
       0013  __r7
       0014  __r6
       0015  __r5
       0016  __r4
       0017  __r3
       0018  __r2
       0019  __r1
       001A  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0005 =      5. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       001B  _Status
       001C  _Zustand_Output
       001D  _Zustand_Input
       001E  _LM75_Data
       001F  _WhichButton

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ timer16int.asm, timer16.asm, spimint.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, i2chwrsrcinits.asm ]
[ i2chwmstr.asm, i2chwint.asm, i2chwcommon.asm, rZ.asm, rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm ]
[ r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0xc
-BI2C_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

