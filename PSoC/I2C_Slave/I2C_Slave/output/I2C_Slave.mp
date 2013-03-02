Project:      output/I2C_Slave
Build Number: 0
Date:         Tue Oct 09 21:13:09 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0089 =    137. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01B5  LoadConfigTBL_i2c_slave_Bank0
       0204  LoadConfigTBL_i2c_slave_Bank1
       0229  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0229   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0229  __func_lit_start
       022B  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   022B   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       022B  LoadConfigTBL_i2c_slave_Ordered
       0330  LoadConfigInit
       0330  _LoadConfigInit
       0340  LoadConfig_i2c_slave
       0340  _LoadConfig_i2c_slave
       039B  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   039B   03E6 =    998. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       039B  _LCD_PrCString
       039B  LCD_PrCString
       03AD  LCD_HEX_STR
       03BD  LCD_PrHexByte
       03BD  _LCD_PrHexByte
       03D0  _LCD_PrHexInt
       03D0  LCD_PrHexInt
       03D7  _LCD_PrString
       03D7  LCD_PrString
       03E9  LCD_WriteData
       03E9  LCD_Write_Data
       03E9  _LCD_Write_Data
       03E9  _LCD_WriteData
       03FD  _LCD_Control
       03FD  LCD_Control
       04AD  _LCD_Start
       04AD  _LCD_Init
       04AD  LCD_Start
       04AD  LCD_Init
       051C  LCD_ROW_OFFSET
       0520  LCD_Position
       0520  _LCD_Position
       0530  LCD_Delay50uTimes
       0530  _LCD_Delay50uTimes
       0536  LCD_Delay50u_Table
       053E  LCD_Delay50u
       053E  _LCD_Delay50u
       0552  _LCD_DrawBG
       0583  _LCD_DrawVBG
       05B7  LCD_InitVBG
       05B7  _LCD_InitVBG
       05E8  LCD_BG_TYPE1
       05EF  LCD_BG_TYPE2
       05F6  _LCD_InitBG
       05F6  LCD_InitBG
       062A  _EzI2Cs_ISR
       070D  EzI2Cs_Start
       070D  _EzI2Cs_Start
       073E  _EzI2Cs_GetActivity
       073E  EzI2Cs_GetActivity
       0749  EzI2Cs_GetAddr
       0749  _EzI2Cs_GetAddr
       074C  EzI2Cs_ResumeInt
       074C  _EzI2Cs_ResumeInt
       074E  _EzI2Cs_EnableInt
       074E  EzI2Cs_EnableInt
       0759  EzI2Cs_Stop
       0759  _EzI2Cs_Stop
       0760  EzI2Cs_DisableInt
       0760  _EzI2Cs_DisableInt
       0764  _EzI2Cs_DisableSlave
       0764  EzI2Cs_DisableSlave
       0768  EzI2Cs_SetRamBuffer
       0768  _EzI2Cs_SetRamBuffer
       0781  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0781   0067 =    103. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0781  __text_start
       0781  _main
       07DF  _I2C_Init
       07E8  __xidata_start
       07E8  __text_end
       07EE  __xidata_end

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
               virtual_registers   000B   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       000B  __r1
       000C  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       000D  _Wert

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ psocconfigtbl.asm, psocconfig.asm, lcd.asm, ezi2csint.asm, ezi2cs.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0xb
-Bi2c_slave_RAM
-rwh:SSCParmBlk:0xf7.0xff

