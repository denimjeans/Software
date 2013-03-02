Project:      output/Laufschrift
Build Number: 0
Date:         Wed Feb 22 21:16:04 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0098 =    152. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  LoadConfigTBL_Laufschrift_Bank0
       0201  LoadConfigTBL_Laufschrift_Bank1
       0238  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0238   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0238  __func_lit_start
       023A  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   023A   016A =    362. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       023A  LoadConfigTBL_Laufschrift_Ordered
       033F  _LoadConfigInit
       033F  LoadConfigInit
       0349  _LoadConfig_Laufschrift
       0349  LoadConfig_Laufschrift
       03A4  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03A4   00E7 =    231. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03A4  _Timer16_ISR
       03A8  Timer16_EnableInt
       03A8  _Timer16_EnableInt
       03AC  Timer16_Start
       03AC  _Timer16_DisableInt
       03AC  _Timer16_Start
       03B0  wTimer16_ReadCounter
       03B0  _LED7SEG_ISR
       03B0  _Timer16_wReadCompareValue
       03B0  _wTimer16_ReadCompareValue
       03B0  _Timer16_WritePeriod
       03B0  wTimer16_ReadTimer
       03B0  wTimer16_ReadCompareValue
       03B0  _Timer16_Stop
       03B0  _Timer16_WriteCompareValue
       03B0  wTimer16_ReadTimerSaveCV
       03B0  wTimer16_CaptureCounter
       03B0  _wTimer16_CaptureCounter
       03B0  _wTimer16_ReadCounter
       03B0  _wTimer16_ReadTimerSaveCV
       03B0  _Timer16_wReadTimer
       03B0  _wTimer16_ReadTimer
       03B0  _Timer16_wReadTimerSaveCV
       03D7  _LED7SEG_Start
       03D7  LED7SEG_Start
       0404  LED7SEG_Dim
       0404  LED7SEG_Stop
       0404  _LED7SEG_Update
       0404  LED7SEG_Update
       0460  _LED7SEG_PutHex
       0460  LED7SEG_PutHex
       0478  LED7SEG_PutPattern
       0478  _LED7SEG_PutPattern
       048B  __UserModules_end
       048B  LED7SEG_DP
       048B  LED7SEG_DispInt

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   048B   00B1 =    177. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       048B  __text_start
       048B  _main
       0527  _Timer
       053C  __xidata_start
       053C  __text_end
       0583  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   0179 =    377. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0176  _bGetPowerSetting
       0176  bGetPowerSetting

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
               virtual_registers   003F   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       003F  __r1
       0040  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   003F =     63. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0006  _text
       0025  _ascii
       0041  _Flag
       0043  _Zaehler_Text
       0045  _Segment

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ timer16int.asm, timer16.asm, psocconfigtbl.asm, psocconfig.asm, led7segint.asm, led7seg.asm ]
[ r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x3f
-BLaufschrift_RAM	allocated at: 0
-rwh:SSCParmBlk:0xf7.0xff

