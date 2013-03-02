Project:      output/CAN_Bus
Build Number: 0
Date:         Mon Feb 27 20:06:06 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   010A =    266. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  _SPI_read
       01A1  _SPI_write
       01A2  _SPI_reset
       01A3  _SPI_rts0
       01A4  _SPI_bitmodify
       01A5  _Cnf1
       01A6  _Cnf2
       01A7  _Cnf3
       01A8  _Canctrl
       01A9  _Caninte
       01AA  _Txb0ctrl
       01AB  _Txb0sidh
       01AC  _Txb0sidl
       01AD  _Txb0eid8
       01AE  _Txb0eid0
       01AF  _Txb0dlc
       01B0  _Txb0d0
       01B1  _Txb0d1
       01B2  _Txb0d2
       01B3  _Txb0d3
       01B4  _Txb0d4
       01B5  _Txb0d5
       01B6  _Txb0d6
       01B7  _Txb0d7
       01B8  _Rxm0sidh
       01B9  _Rxm0sidl
       01BA  _Rxm0eid8
       01BB  _Rxm0eid0
       01BC  _Rxm1sidh
       01BD  _Rxm1sidl
       01BE  _Rxm1eid8
       01BF  _Rxm1eid0
       01C0  _Rxb0ctrl
       01C1  _Rxb1ctrl
       01C2  _Settings_Canctrl
       0212  LoadConfigTBL_can_bus_Bank0
       0273  LoadConfigTBL_can_bus_Bank1
       02AA  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   02AA   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       02AA  __func_lit_start
       02AC  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   02AC   016A =    362. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       02AC  LoadConfigTBL_can_bus_Ordered
       03B1  LoadConfigInit
       03B1  _LoadConfigInit
       03BB  _LoadConfig_can_bus
       03BB  LoadConfig_can_bus
       0416  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0416   0192 =    402. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0426  TX8SW_Start
       0426  _TX8SW_Start
       043E  _TX8SW_Stop
       043E  TX8SW_Stop
       044C  TX8SW_SendData
       044C  _TX8SW_PutChar
       044C  TX8SW_PutChar
       044C  _TX8SW_SendData
       0499  _TX8SW_PutSHexByte
       0499  TX8SW_PutSHexByte
       04AC  _TX8SW_PutSHexInt
       04AC  TX8SW_PutSHexInt
       04B4  TX8SW_CPutString
       04B4  _TX8SW_CPutString
       04C6  _TX8SW_PutString
       04C6  TX8SW_PutString
       04DA  TX8SW_PutCRLF
       04DA  _TX8SW_PutCRLF
       04E3  _TX8SW_Write
       04E3  TX8SW_Write
       0506  TX8SW_CWrite
       0506  _TX8SW_CWrite
       0529  _Timer16_ISR
       052D  Timer16_EnableInt
       052D  _Timer16_EnableInt
       0531  _Timer16_DisableInt
       0531  Timer16_DisableInt
       0535  _Timer16_Start
       0535  Timer16_Start
       0539  Timer16_Stop
       0539  _Timer16_Stop
       053D  Timer16_WritePeriod
       053D  _Timer16_WritePeriod
       0543  _Timer16_WriteCompareValue
       0543  Timer16_WriteCompareValue
       0549  _wTimer16_ReadCompareValue
       0549  Timer16_wReadCompareValue
       0549  wTimer16_ReadCompareValue
       0549  _Timer16_wReadCompareValue
       054F  _wTimer16_ReadTimerSaveCV
       054F  _Timer16_wReadTimerSaveCV
       054F  _wTimer16_ReadCounter
       054F  Timer16_wReadTimerSaveCV
       054F  wTimer16_ReadTimerSaveCV
       054F  wTimer16_ReadCounter
       0585  _Timer16_wReadTimer
       0585  Timer16_wReadTimer
       0585  wTimer16_ReadTimer
       0585  _wTimer16_CaptureCounter
       0585  _wTimer16_ReadTimer
       0585  wTimer16_CaptureCounter
       058D  _SPIM_ISR
       058E  SPIM_EnableInt
       058E  _SPIM_EnableInt
       0592  _SPIM_DisableInt
       0592  SPIM_DisableInt
       0596  _SPIM_Start
       0596  SPIM_Start
       059B  _SPIM_Stop
       059B  SPIM_Stop
       059F  SPIM_SendTxData
       059F  _SPIM_SendTxData
       05A2  _SPIM_bReadRxData
       05A2  _bSPIM_ReadRxData
       05A2  bSPIM_ReadRxData
       05A2  SPIM_bReadRxData
       05A5  _SPIM_bReadStatus
       05A5  _bSPIM_ReadStatus
       05A5  SPIM_bReadStatus
       05A5  bSPIM_ReadStatus
       05A8  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   05A8   0259 =    601. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       05A8  __text_start
       05A8  _main
       0601  _Read_Register
       06D2  _Write_Register
       07D8  _MCP2515_Init
       07FD  _Bitmodify
       07FE  _Timer16
       0801  __xidata_start
       0801  __text_end
       0807  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   014E =    334. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       014B  _bGetPowerSetting
       014B  bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0003 =      3. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  NO_SHADOW
       0002  _NO_SHADOW
       0002  Port_0_Data_SHADE
       0002  _Port_0_Data_SHADE

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0003   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0003  __r1
       0004  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0005  _Canin

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ tx8sw.asm, timer16int.asm, timer16.asm, spimint.asm, spim.asm, psocconfigtbl.asm, psocconfig.asm ]
[ r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x3
-Bcan_bus_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

