Project:      output/Evalboard
Build Number: 0
Date:         Sun Jul 17 17:58:46 2011
Compiler:     ICCM8C
Version:      7.04

  ROM 7% full. 2210 out of 32768 bytes used (does not include absolute areas).
  RAM 1% full. 14 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   008C =    140. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_evalboard_Bank0
       01FB  LoadConfigTBL_evalboard_Bank1
       022C  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   022C   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       022C  __func_lit_start
       022E  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   022E   0179 =    377. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       022E  LoadConfigTBL_evalboard_Ordered
       0333  _LoadConfigInit
       0333  LoadConfigInit
       034C  _LoadConfig_evalboard
       034C  LoadConfig_evalboard
       03A7  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03A7   060A =   1546. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       03A7  _Timer16_ISR
       03AB  _Timer16_EnableInt
       03AB  Timer16_EnableInt
       03AF  _Timer16_DisableInt
       03AF  Timer16_DisableInt
       03B3  Timer16_Start
       03B3  _Timer16_Start
       03B7  Timer16_Stop
       03B7  _Timer16_Stop
       03BB  Timer16_WritePeriod
       03BB  _Timer16_WritePeriod
       03C1  _Timer16_WriteCompareValue
       03C1  Timer16_WriteCompareValue
       03C7  wTimer16_ReadCompareValue
       03C7  _Timer16_wReadCompareValue
       03C7  _wTimer16_ReadCompareValue
       03C7  Timer16_wReadCompareValue
       03CD  Timer16_wReadTimerSaveCV
       03CD  wTimer16_ReadTimerSaveCV
       03CD  _Timer16_wReadTimerSaveCV
       03CD  _wTimer16_ReadTimerSaveCV
       03CD  wTimer16_ReadCounter
       03CD  _wTimer16_ReadCounter
       0403  wTimer16_ReadTimer
       0403  Timer16_wReadTimer
       0403  _wTimer16_CaptureCounter
       0403  _wTimer16_ReadTimer
       0403  _Timer16_wReadTimer
       0403  wTimer16_CaptureCounter
       040B  _LCD_PrCString
       040B  LCD_PrCString
       041D  LCD_HEX_STR
       042D  LCD_PrHexByte
       042D  _LCD_PrHexByte
       0440  LCD_PrHexInt
       0440  _LCD_PrHexInt
       0447  _LCD_PrString
       0447  LCD_PrString
       0459  _LCD_WriteData
       0459  _LCD_Write_Data
       0459  LCD_WriteData
       0459  LCD_Write_Data
       046D  LCD_Control
       046D  _LCD_Control
       051D  LCD_Init
       051D  _LCD_Init
       051D  LCD_Start
       051D  _LCD_Start
       058C  LCD_ROW_OFFSET
       0590  LCD_Position
       0590  _LCD_Position
       05A0  LCD_Delay50uTimes
       05A0  _LCD_Delay50uTimes
       05A6  LCD_Delay50u_Table
       05AE  LCD_Delay50u
       05AE  _LCD_Delay50u
       05C2  _LCD_DrawBG
       05F3  _LCD_DrawVBG
       0627  LCD_InitVBG
       0627  _LCD_InitVBG
       0658  LCD_BG_TYPE1
       065F  LCD_BG_TYPE2
       0666  LCD_InitBG
       0666  _LCD_InitBG
       069A  _I2CM_Start
       069A  I2CM_Start
       06B7  _I2CM_Stop
       06B7  I2CM_Stop
       06B8  _I2CM_fReadBytes
       071D  _I2CM_bWriteBytes
       0779  _I2CM_bWriteCBytes
       07C9  I2CM_fSendRepeatStart
       07C9  _I2CM_fSendRepeatStart
       07FF  _I2CM_fSendStart
       07FF  I2CM_fSendStart
       0839  _I2CM_fWrite
       0839  I2CM_fWrite
       08D0  _I2CM_bRead
       08D0  I2CM_bRead
       097B  _I2CM_SendStop
       097B  I2CM_SendStop
       09B1  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   09B1   0091 =    145. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       09B1  _main
       09B1  __text_start
       0A32  _Timer
       0A42  __text_end
       0A49  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0068   0146 =    326. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0143  bGetPowerSetting
       0143  _bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0006 =      6. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _Port_0_Data_SHADE
       0000  NO_SHADOW
       0000  Port_0_Data_SHADE
       0000  _NO_SHADOW
       0001  _Port_2_Data_SHADE
       0001  Port_2_Data_SHADE
       0002  Port_0_DriveMode_0_SHADE
       0002  _Port_0_DriveMode_0_SHADE
       0003  _Port_0_DriveMode_1_SHADE
       0003  Port_0_DriveMode_1_SHADE
       0004  Port_2_DriveMode_0_SHADE
       0004  _Port_2_DriveMode_0_SHADE
       0005  Port_2_DriveMode_1_SHADE
       0005  _Port_2_DriveMode_1_SHADE

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                   evalboard_RAM   0006   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0006  I2CM_bStatus
       0006  _I2CM_bStatus
       0007  I2CM_bData
       0007  _I2CM_bData
       0008  I2CM_bAddr
       0008  _I2CM_bAddr

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   000A   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000A  __r1
       000B  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       000C  _Wert
       000D  _Port

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ timer16int.asm, timer16.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, i2cm.asm, r1.asm, r0.asm ]


Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0xa
-Bevalboard_RAM	allocated at: 0x6

