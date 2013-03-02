Project:      output/LCD_Zeichen
Build Number: 0
Date:         Mon Aug 15 22:22:39 2011
Compiler:     ICCM8C
Version:      7.04

  ROM 5% full. 1413 out of 32768 bytes used (does not include absolute areas).
  RAM 1% full. 5 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0088 =    136. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01B4  LoadConfigTBL_LCD_Zeichen_Bank0
       0203  LoadConfigTBL_LCD_Zeichen_Bank1
       0228  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0228   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0228  __func_lit_start
       022A  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   022A   0170 =    368. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       022A  LoadConfigTBL_LCD_Zeichen_Ordered
       032F  LoadConfigInit
       032F  _LoadConfigInit
       033F  LoadConfig_LCD_Zeichen
       033F  _LoadConfig_LCD_Zeichen
       039A  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   039A   028F =    655. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       039A  _LCD_1_PrCString
       039A  LCD_1_PrCString
       03AC  LCD_1_HEX_STR
       03BC  _LCD_1_PrHexByte
       03BC  LCD_1_PrHexByte
       03CF  _LCD_1_PrHexInt
       03CF  LCD_1_PrHexInt
       03D6  _LCD_1_PrString
       03D6  LCD_1_PrString
       03E8  _LCD_1_Write_Data
       03E8  LCD_1_WriteData
       03E8  LCD_1_Write_Data
       03E8  _LCD_1_WriteData
       03FC  LCD_1_Control
       03FC  _LCD_1_Control
       04AC  LCD_1_Start
       04AC  _LCD_1_Start
       04AC  _LCD_1_Init
       04AC  LCD_1_Init
       051B  LCD_1_ROW_OFFSET
       051F  LCD_1_Position
       051F  _LCD_1_Position
       052F  _LCD_1_Delay50uTimes
       052F  LCD_1_Delay50uTimes
       0535  LCD_1_Delay50u_Table
       053D  _LCD_1_Delay50u
       053D  LCD_1_Delay50u
       0551  _LCD_1_DrawBG
       0582  _LCD_1_DrawVBG
       05B6  LCD_1_InitVBG
       05B6  _LCD_1_InitVBG
       05E7  LCD_1_BG_TYPE1
       05EE  LCD_1_BG_TYPE2
       05F5  _LCD_1_InitBG
       05F5  LCD_1_InitBG
       0629  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0629   00FC =    252. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0629  _main
       0629  __text_start
       0691  _Write_Symbol_Heart
       06DB  _Write_Symbol_Smiley
       0725  __text_end
       0727  __xidata_end

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
                    InterruptRAM   0000   0003 =      3. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _Port_2_Data_SHADE
       0000  NO_SHADOW
       0000  _NO_SHADOW
       0000  Port_2_Data_SHADE
       0001  Port_2_DriveMode_0_SHADE
       0001  _Port_2_DriveMode_0_SHADE
       0002  Port_2_DriveMode_1_SHADE
       0002  _Port_2_DriveMode_1_SHADE

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0003   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0003  __r1
       0004  __r0

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ lcd_1.asm, psocconfigtbl.asm, psocconfig.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x3
-BLCD_Zeichen_RAM

