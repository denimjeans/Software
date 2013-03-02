Project:      output/PSoC_Master
Build Number: 0
Date:         Wed Sep  7 23:28:51 2011
Compiler:     ICCM8C
Version:      7.04

  ROM 8% full. 2349 out of 32768 bytes used (does not include absolute areas).
  RAM 7% full. 121 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00AE =    174. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01AA  LoadConfigTBL_psoc_master_Bank0
       0211  LoadConfigTBL_psoc_master_Bank1
       024E  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   024E   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       024E  __func_lit_start
       0250  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0250   0170 =    368. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0250  LoadConfigTBL_psoc_master_Ordered
       0355  LoadConfigInit
       0355  _LoadConfigInit
       0365  LoadConfig_psoc_master
       0365  _LoadConfig_psoc_master
       03C0  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03C0   0555 =   1365. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       03C0  _UART_TX_ISR
       03C1  _UART_RX_ISR
       0438  UART_EnableInt
       0438  _UART_EnableInt
       043F  UART_DisableInt
       043F  _UART_DisableInt
       0446  UART_SetTxIntMode
       0446  _UART_SetTxIntMode
       0458  _UART_Start
       0458  UART_Start
       0461  UART_Stop
       0461  _UART_Stop
       0468  UART_SendData
       0468  _UART_SendData
       046B  _bUART_ReadTxStatus
       046B  _UART_bReadTxStatus
       046B  UART_bReadTxStatus
       046B  bUART_ReadTxStatus
       046E  _UART_bReadRxData
       046E  _bUART_ReadRxData
       046E  bUART_ReadRxData
       046E  UART_bReadRxData
       0471  _bUART_ReadRxStatus
       0471  UART_bReadRxStatus
       0471  bUART_ReadRxStatus
       0471  _UART_bReadRxStatus
       0474  _UART_TxIntMode
       0474  UART_TxIntMode
       0487  _UART_IntCntl
       0487  UART_IntCntl
       04B2  _UART_PutSHexByte
       04B2  UART_PutSHexByte
       04C5  _UART_PutSHexInt
       04C5  UART_PutSHexInt
       04CC  UART_PutChar
       04CC  _UART_PutChar
       04D4  UART_cGetChar
       04D4  _UART_cGetChar
       04DC  UART_cReadChar
       04DC  _UART_cReadChar
       04F3  UART_iReadChar
       04F3  _UART_iReadChar
       0509  UART_PutString
       0509  _UART_PutString
       051B  _UART_Write
       051B  UART_Write
       0543  UART_CWrite
       0543  _UART_CWrite
       056F  _UART_CPutString
       056F  UART_CPutString
       0581  UART_PutCRLF
       0581  _UART_PutCRLF
       058A  _UART_CmdReset
       058A  UART_CmdReset
       05A0  UART_bCmdCheck
       05A0  _UART_bCmdCheck
       05A8  UART_bErrCheck
       05A8  _UART_bErrCheck
       05B3  UART_bCmdLength
       05B3  _UART_bCmdLength
       05B9  UART_szGetParam
       05B9  _UART_szGetParam
       0617  UART_szGetRestOfParams
       0617  _UART_szGetRestOfParams
       0622  _Timer16_ISR
       0626  Timer16_EnableInt
       0626  _Timer16_EnableInt
       062A  Timer16_DisableInt
       062A  _Timer16_DisableInt
       062E  _Timer16_Start
       062E  Timer16_Start
       0632  Timer16_Stop
       0632  _Timer16_Stop
       0636  _Timer16_WritePeriod
       0636  Timer16_WritePeriod
       063C  Timer16_WriteCompareValue
       063C  _Timer16_WriteCompareValue
       0642  _wTimer16_ReadCompareValue
       0642  _Timer16_wReadCompareValue
       0642  Timer16_wReadCompareValue
       0642  wTimer16_ReadCompareValue
       0648  wTimer16_ReadTimerSaveCV
       0648  _wTimer16_ReadCounter
       0648  Timer16_wReadTimerSaveCV
       0648  _Timer16_wReadTimerSaveCV
       0648  _wTimer16_ReadTimerSaveCV
       0648  wTimer16_ReadCounter
       067E  wTimer16_CaptureCounter
       067E  Timer16_wReadTimer
       067E  _wTimer16_ReadTimer
       067E  _wTimer16_CaptureCounter
       067E  _Timer16_wReadTimer
       067E  wTimer16_ReadTimer
       0686  LCD_PrCString
       0686  _LCD_PrCString
       0698  LCD_HEX_STR
       06A8  _LCD_PrHexByte
       06A8  LCD_PrHexByte
       06BB  LCD_PrHexInt
       06BB  _LCD_PrHexInt
       06C2  LCD_PrString
       06C2  _LCD_PrString
       06D4  _LCD_Write_Data
       06D4  LCD_WriteData
       06D4  _LCD_WriteData
       06D4  LCD_Write_Data
       06E8  _LCD_Control
       06E8  LCD_Control
       0798  LCD_Start
       0798  _LCD_Init
       0798  LCD_Init
       0798  _LCD_Start
       0807  LCD_ROW_OFFSET
       080B  LCD_Position
       080B  _LCD_Position
       081B  _LCD_Delay50uTimes
       081B  LCD_Delay50uTimes
       0821  LCD_Delay50u_Table
       0829  LCD_Delay50u
       0829  _LCD_Delay50u
       083D  _LCD_DrawBG
       086E  _LCD_DrawVBG
       08A2  LCD_InitVBG
       08A2  _LCD_InitVBG
       08D3  LCD_BG_TYPE1
       08DA  LCD_BG_TYPE2
       08E1  LCD_InitBG
       08E1  _LCD_InitBG
       0915  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0915   01B8 =    440. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0915  _main
       0915  __text_start
       09BE  _Timer_Int
       09BF  _UART_Int
       0A9F  _memsetLMM
       0AAA  _memset
       0ACD  __text_end
       0AD7  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0068   0151 =    337. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       014E  bGetPowerSetting
       014E  _bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0005 =      5. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  UART_fStatus
       0000  _UART_fStatus
       0001  _UART_bRxCnt
       0001  UART_bRxCnt
       0002  _Port_2_Data_SHADE
       0002  _NO_SHADOW
       0002  NO_SHADOW
       0002  Port_2_Data_SHADE
       0003  Port_2_DriveMode_0_SHADE
       0003  _Port_2_DriveMode_0_SHADE
       0004  _Port_2_DriveMode_1_SHADE
       0004  Port_2_DriveMode_1_SHADE

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        UART_RAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0055  UART_aRxBuffer
       0055  _UART_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0065   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0065  __rZ
       0066  __rY
       0067  __rX
       0068  __r11
       0069  __r10
       006A  __r9
       006B  __r8
       006C  __r7
       006D  __r6
       006E  __r5
       006F  __r4
       0070  __r3
       0071  __r2
       0072  __r1
       0073  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0054 =     84. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0005  _Buffer
       0074  _Zeiger
       0076  _p

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, timer16int.asm, timer16.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm ]
[ rZ.asm, rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm ]
[ r1.asm, r0.asm, memset.s ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x65
-Bpsoc_master_RAM	allocated at: 0

