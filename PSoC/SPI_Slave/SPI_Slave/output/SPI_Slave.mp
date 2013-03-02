Project:      output/SPI_Slave
Build Number: 0
Date:         Sun Feb 05 11:12:11 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   008C =    140. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_spi_slave_Bank0
       01FB  LoadConfigTBL_spi_slave_Bank1
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
                     psoc_config   022E   016A =    362. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       022E  LoadConfigTBL_spi_slave_Ordered
       0333  LoadConfigInit
       0333  _LoadConfigInit
       033D  LoadConfig_spi_slave
       033D  _LoadConfig_spi_slave
       0398  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0398   01B3 =    435. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0398  _SPIS_ISR
       0399  SPIS_EnableInt
       0399  _SPIS_EnableInt
       039D  SPIS_DisableInt
       039D  _SPIS_DisableInt
       03A1  _SPIS_Start
       03A1  SPIS_Start
       03A6  SPIS_Stop
       03A6  _SPIS_Stop
       03AA  _SPIS_SetupTxData
       03AA  SPIS_SetupTxData
       03AD  _bSPIS_ReadRxData
       03AD  SPIS_bReadRxData
       03AD  _SPIS_bReadRxData
       03AD  bSPIS_ReadRxData
       03B0  _SPIS_bReadStatus
       03B0  bSPIS_ReadStatus
       03B0  _bSPIS_ReadStatus
       03B0  SPIS_bReadStatus
       03B3  _SPIS_DisableSS
       03B3  SPIS_SetSS
       03B3  SPIS_DisableSS
       03B3  _SPIS_SetSS
       03BB  _SPIS_ClearSS
       03BB  SPIS_EnableSS
       03BB  SPIS_ClearSS
       03BB  _SPIS_EnableSS
       03C3  _LED7SEG_ISR
       03EA  _LED7SEG_Start
       03EA  LED7SEG_Start
       0417  LED7SEG_Stop
       0417  _LED7SEG_Stop
       042D  _LED7SEG_Dim
       042D  LED7SEG_Dim
       043C  LED7SEG_Update
       043C  _LED7SEG_Update
       0498  _LED7SEG_PutHex
       0498  LED7SEG_PutHex
       04B0  _LED7SEG_PutPattern
       04B0  LED7SEG_PutPattern
       04C3  _LED7SEG_DP
       04C3  LED7SEG_DP
       04E0  LED7SEG_DispInt
       04E0  _LED7SEG_DispInt
       054B  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   054B   0044 =     68. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       054B  __text_start
       054B  _main
       058F  __xidata_start
       058F  __text_end
       0596  __xidata_end

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
                    InterruptRAM   0000   0006 =      6. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _NO_SHADOW
       0000  Port_4_Data_SHADE
       0000  NO_SHADOW
       0000  _Port_4_Data_SHADE
       0001  _LED7SEG_ScanStatus
       0001  LED7SEG_ScanStatus
       0002  _LED7SEG_DigitRAM
       0002  LED7SEG_DigitRAM

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0008   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0008  __r1
       0009  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0006  _ADWandler

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ spisint.asm, spis.asm, psocconfigtbl.asm, psocconfig.asm, led7segint.asm, led7seg.asm, r1.asm ]
[ r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x8
-Bspi_slave_RAM
-rwh:SSCParmBlk:0xf7.0xff

