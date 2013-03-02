Project:      output/DS1307
Build Number: 0
Date:         Wed Jul 18 16:47:11 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   00B1 =    177. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01DD  LoadConfigTBL_DS1307_Bank0
       022C  LoadConfigTBL_DS1307_Bank1
       0251  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0251   0002 =      2. bytes (rel,con,rom,proclab)

       Addr  Global Symbol
      -----  --------------------------------
       0251  __func_lit_start
       0253  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0253   0170 =    368. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0253  LoadConfigTBL_DS1307_Ordered
       0358  LoadConfigInit
       0358  _LoadConfigInit
       0368  LoadConfig_DS1307
       0368  _LoadConfig_DS1307
       03C3  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03C3   059E =   1438. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       03C3  LCD_PrCString
       03C3  _LCD_PrCString
       03D5  LCD_HEX_STR
       03E5  LCD_PrHexByte
       03E5  _LCD_PrHexByte
       03F8  _LCD_PrHexInt
       03F8  LCD_PrHexInt
       03FF  LCD_PrString
       03FF  _LCD_PrString
       0411  _LCD_Write_Data
       0411  LCD_WriteData
       0411  LCD_Write_Data
       0411  _LCD_WriteData
       0425  LCD_Control
       0425  _LCD_Control
       04D5  _LCD_Init
       04D5  LCD_Start
       04D5  _LCD_Start
       04D5  LCD_Init
       0544  LCD_ROW_OFFSET
       0548  _LCD_Position
       0548  LCD_Position
       0558  _LCD_Delay50uTimes
       0558  LCD_Delay50uTimes
       055E  LCD_Delay50u_Table
       0566  LCD_Delay50u
       0566  _LCD_Delay50u
       057A  _I2CHW_Start
       057A  I2CHW_Start
       057B  I2CHW_ResumeInt
       057B  _I2CHW_ResumeInt
       057E  _I2CHW_EnableInt
       057E  I2CHW_EnableInt
       058A  I2CHW_ClearInt
       058A  _I2CHW_ClearInt
       0593  I2CHW_EnableMstr
       0593  _I2CHW_EnableMstr
       05A3  _I2CHW_DisableInt
       05A3  I2CHW_Stop
       05A3  I2CHW_DisableInt
       05A3  _I2CHW_Stop
       05A7  I2CHW_DisableMstr
       05A7  _I2CHW_DisableMstr
       05AB  _I2CHW_fReadBytes
       05EF  _I2CHW_bWriteBytes
       0633  _I2CHW_bWriteCBytes
       069F  _I2CHW_fSendRepeatStart
       069F  I2CHW_fSendRepeatStart
       06DB  _I2CHW_fSendStart
       06DB  I2CHW_fSendStart
       071F  _I2CHW_fWrite
       071F  I2CHW_fWrite
       075F  I2CHW_bRead
       075F  _I2CHW_bRead
       0795  I2CHW_SendStop
       0795  _I2CHW_SendStop
       079E  _I2CHW_bReadBusStatus
       079E  I2CHW_bReadBusStatus
       07A4  _I2CHW_ISR
       08E1  I2CHW_InitWrite
       08E1  _I2CHW_InitWrite
       091F  I2CHW_InitRamRead
       091F  _I2CHW_InitRamRead
       094C  I2CHW_InitFlashRead
       094C  _I2CHW_InitFlashRead
       094D  _I2CHW_bReadI2CStatus
       094D  I2CHW_bReadI2CStatus
       0953  I2CHW_ClrRdStatus
       0953  _I2CHW_ClrRdStatus
       095A  I2CHW_ClrWrStatus
       095A  _I2CHW_ClrWrStatus
       0961  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0961   03E3 =    995. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0961  __text_start
       0961  _main
       09B5  _I2C_Init
       09C1  _RTC_ReadTime
       0A01  _RTC_SetTime
       0A2F  _RTC_WriteReg
       0A6A  _RTC_SetRegAddress
       0AA0  _Print_Time
       0CA8  _RTC_Read_ISR
       0D40  PSoC_GPIO_ISR
       0D44  __xidata_start
       0D44  __text_end
       0D4A  __xidata_end

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
                            data   0000   0012 =     18. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       001B  _Time
       0023  _SetTime
       002B  _bRTC_RegPointer
       002C  _fReadRTC

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ psocgpioint.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, i2chwrsrcinits.asm, i2chwmstr.asm ]
[ i2chwint.asm, i2chwcommon.asm, rZ.asm, rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm, r6.asm ]
[ r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm ]

Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0xc
-BDS1307_RAM
-rwh:SSCParmBlk:0xf7.0xff

