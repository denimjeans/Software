Project:      output/Funk_Lampe
Build Number: 0
Date:         Mon Aug 20 20:16:28 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   00B0 =    176. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       018A  LoadConfigTBL_funk_lampe_Bank0
       01C7  LoadConfigTBL_funk_lampe_Bank1
       0200  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0200   0002 =      2. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0200  __idata_start
       0202  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0202   00A3 =    163. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0202  LoadConfigTBL_funk_lampe_Ordered
       0247  _LoadConfigInit
       0247  LoadConfigInit
       024E  _LoadConfig_funk_lampe
       024E  LoadConfig_funk_lampe
       02A5  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   02A5   0262 =    610. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       02A5  _UART_TX_ISR
       02A6  _UART_RX_ISR
       02F6  UART_EnableInt
       02F6  _UART_EnableInt
       02FD  UART_DisableInt
       02FD  _UART_DisableInt
       0304  _UART_SetTxIntMode
       0304  UART_SetTxIntMode
       0316  _UART_Start
       0316  UART_Start
       031F  UART_Stop
       031F  _UART_Stop
       0326  UART_SendData
       0326  _UART_SendData
       0329  _UART_bReadTxStatus
       0329  bUART_ReadTxStatus
       0329  UART_bReadTxStatus
       0329  _bUART_ReadTxStatus
       032C  bUART_ReadRxData
       032C  UART_bReadRxData
       032C  _bUART_ReadRxData
       032C  _UART_bReadRxData
       032F  UART_bReadRxStatus
       032F  bUART_ReadRxStatus
       032F  _UART_bReadRxStatus
       032F  _bUART_ReadRxStatus
       0332  UART_TxIntMode
       0332  _UART_TxIntMode
       0345  _UART_IntCntl
       0345  UART_IntCntl
       0370  UART_PutSHexByte
       0370  _UART_PutSHexByte
       0383  UART_PutSHexInt
       0383  _UART_PutSHexInt
       038A  UART_PutChar
       038A  _UART_PutChar
       0392  _UART_cGetChar
       0392  UART_cGetChar
       039A  _UART_cReadChar
       039A  UART_cReadChar
       03B1  _UART_iReadChar
       03B1  UART_iReadChar
       03C7  UART_PutString
       03C7  _UART_PutString
       03D1  _UART_Write
       03D1  UART_Write
       03E9  _UART_CWrite
       03E9  UART_CWrite
       0411  UART_CPutString
       0411  _UART_CPutString
       0423  _UART_PutCRLF
       0423  UART_PutCRLF
       042C  UART_CmdReset
       042C  _UART_CmdReset
       0439  UART_bCmdCheck
       0439  _UART_bCmdCheck
       043E  _UART_bErrCheck
       043E  UART_bErrCheck
       0446  _UART_bCmdLength
       0446  UART_bCmdLength
       0449  _UART_szGetParam
       0449  UART_szGetParam
       0497  _UART_szGetRestOfParams
       0497  UART_szGetRestOfParams
       049F  _Timer8_ISR
       04A3  _Timer8_EnableInt
       04A3  Timer8_EnableInt
       04A7  Timer8_DisableInt
       04A7  _Timer8_DisableInt
       04AB  _Timer8_Start
       04AB  Timer8_Start
       04AF  Timer8_Stop
       04AF  _Timer8_Stop
       04B3  _Timer8_WritePeriod
       04B3  Timer8_WritePeriod
       04B6  Timer8_WriteCompareValue
       04B6  _Timer8_WriteCompareValue
       04B9  Timer8_bReadCompareValue
       04B9  _bTimer8_ReadCompareValue
       04B9  _Timer8_bReadCompareValue
       04B9  bTimer8_ReadCompareValue
       04BC  bTimer8_ReadCounter
       04BC  _Timer8_bReadTimerSaveCV
       04BC  bTimer8_ReadTimerSaveCV
       04BC  _bTimer8_ReadCounter
       04BC  Timer8_bReadTimerSaveCV
       04BC  _bTimer8_ReadTimerSaveCV
       04E3  bTimer8_CaptureCounter
       04E3  Timer8_bReadTimer
       04E3  _Timer8_bReadTimer
       04E3  _bTimer8_ReadTimer
       04E3  bTimer8_ReadTimer
       04E3  _bTimer8_CaptureCounter
       04E8  _ADC8_ADC_ISR
       0507  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0507   01B0 =    432. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0507  __text_start
       0507  _main
       05A8  _Timer
       05AB  ADC8_Start
       05AB  _ADC8_Start
       05C8  _ADC8_Stop
       05C8  ADC8_Stop
       05CF  _ADC8_StartADC
       05CF  ADC8_StartADC
       05E4  ADC8_StopADC
       05E4  _ADC8_StopADC
       05EE  _ADC8_fIsDataAvailable
       05EE  ADC8_fIsDataAvailable
       05F1  _ADC8_bGetDataClearFlag
       05F1  ADC8_bGetDataClearFlag
       05F7  _ADC8_bGetData
       05F7  ADC8_bGetData
       05FA  ADC8_ClearFlag
       05FA  _ADC8_ClearFlag
       05FE  _ADC8_bCal
       05FE  ADC8_bCal
       06B7  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0000  _Value
       0002  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0002   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  __r1
       0003  __r0
       0004  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0004   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0004  UART_fStatus
       0004  _UART_fStatus
       0005  _UART_bRxCnt
       0005  UART_bRxCnt
       0006  NO_SHADOW
       0006  _NO_SHADOW
       0006  _ADC8_bResult
       0006  ADC8_bResult
       0007  ADC8_bfStatus
       0007  _ADC8_bfStatus
       0008  __InterruptRAM_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0008   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0008  _String
       0008  __bss_start
       000A  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        UART_RAM   000A   0021 =     33. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000A  UART_aRxBuffer
       000A  _UART_aRxBuffer
       002B  __ramareas_end
       002B  __UART_RAM_end

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
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, timer8int.asm, timer8.asm, psocconfigtbl.asm, psocconfig.asm, adc8int.asm ]
[ adc8.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x150.0xfff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

