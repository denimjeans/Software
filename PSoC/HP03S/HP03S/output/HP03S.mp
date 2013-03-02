Project:      output/HP03S
Build Number: 0
Date:         Tue Jan 29 15:19:46 2013
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   0052 =     82. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0150  LoadConfigTBL_hp03s_Bank0
       0179  LoadConfigTBL_hp03s_Bank1
       01A2  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01A2   00A3 =    163. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       01A2  LoadConfigTBL_hp03s_Ordered
       01E7  LoadConfigInit
       01E7  _LoadConfigInit
       01EE  LoadConfig_hp03s
       01EE  _LoadConfig_hp03s
       0245  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0245   058D =   1421. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0245  _PWM16_ISR
       0246  PWM16_EnableInt
       0246  _PWM16_EnableInt
       024A  _PWM16_DisableInt
       024A  PWM16_DisableInt
       024E  PWM16_Start
       024E  _PWM16_Start
       0252  _PWM16_Stop
       0252  PWM16_Stop
       0256  _PWM16_WritePeriod
       0256  PWM16_WritePeriod
       025C  PWM16_WritePulseWidth
       025C  _PWM16_WritePulseWidth
       0262  PWM16_wReadPulseWidth
       0262  wPWM16_ReadPulseWidth
       0262  _PWM16_wReadPulseWidth
       0262  _wPWM16_ReadPulseWidth
       0268  _PWM16_wReadCounter
       0268  _wPWM16_ReadCounter
       0268  PWM16_wReadCounter
       0268  wPWM16_ReadCounter
       029E  I2CHW_bWriteBytesNoStall
       029E  _I2CHW_bWriteBytesNoStall
       02A7  _I2CHW_bWriteBytes
       02A7  I2CHW_bWriteBytes
       02E9  I2CHW_fReadBytesNoStall
       02E9  _I2CHW_fReadBytesNoStall
       02F2  _I2CHW_fReadBytes
       02F2  I2CHW_fReadBytes
       0334  _I2CHW_bWriteCBytesNoStall
       0334  I2CHW_bWriteCBytesNoStall
       033D  _I2CHW_bWriteCBytes
       033D  I2CHW_bWriteCBytes
       03B4  _I2CHW_fSendRepeatStart
       03B4  I2CHW_fSendRepeatStart
       03FF  _I2CHW_fSendStart
       03FF  I2CHW_fSendStart
       044C  I2CHW_fWrite
       044C  _I2CHW_fWrite
       0496  I2CHW_bRead
       0496  _I2CHW_bRead
       04CB  I2CHW_SendStop
       04CB  _I2CHW_SendStop
       04D4  _I2CHW_Poll
       04D4  I2CHW_Poll
       04D5  _I2CHW_ISR
       070D  _I2CHW_InitMasterWrite
       070D  I2CHW_InitMasterWrite
       0740  I2CHW_InitMasterRamRead
       0740  _I2CHW_InitMasterRamRead
       0762  _I2CHW_InitMasterFlashRead
       0762  I2CHW_InitMasterFlashRead
       0763  I2CHW_bReadBusStatus
       0763  _I2CHW_bReadBusStatus
       0766  I2CHW_bReadMasterStatus
       0766  _I2CHW_bReadMasterStatus
       0769  _I2CHW_ClrMasterRdStatus
       0769  I2CHW_ClrMasterRdStatus
       076D  I2CHW_ClrMasterWrStatus
       076D  _I2CHW_ClrMasterWrStatus
       0771  I2CHW_InitSlaveWrite
       0771  _I2CHW_InitSlaveWrite
       07A4  I2CHW_InitSlaveRamRead
       07A4  _I2CHW_InitSlaveRamRead
       07C6  I2CHW_InitSlaveFlashRead
       07C6  _I2CHW_InitSlaveFlashRead
       07C7  I2CHW_bReadSlaveStatus
       07C7  _I2CHW_bReadSlaveStatus
       07CA  _I2CHW_ClrSlaveRdStatus
       07CA  I2CHW_ClrSlaveRdStatus
       07CE  _I2CHW_ClrSlaveWrStatus
       07CE  I2CHW_ClrSlaveWrStatus
       07D2  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   07D2   000E =     14. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       07D2  __text_start
       07D2  _main
       07E0  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0000   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __r0
       0001  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0001   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0001  _NO_SHADOW
       0001  I2CHW_bStatus
       0001  NO_SHADOW
       0001  _I2CHW_bStatus
       0002  _I2CHW_RsrcStatus
       0002  I2CHW_RsrcStatus
       0003  I2CHW_SlaveAddr
       0003  _I2CHW_SlaveAddr
       0004  I2CHW_MasterStatus
       0004  _I2CHW_MasterStatus
       0005  pI2CHW_MasterWrite_BufLO
       0005  _pI2CHW_MasterWrite_BufLO
       0006  I2CHW_MasterWrite_Count
       0006  _I2CHW_MasterWrite_Count
       0007  pI2CHW_MasterRead_BufLO
       0007  _pI2CHW_MasterRead_BufLO
       0008  I2CHW_MasterRead_Count
       0008  _I2CHW_MasterRead_Count
       0009  _I2CHW_SlaveStatus
       0009  I2CHW_SlaveStatus
       000A  _pI2CHW_SlaveWrite_BufLO
       000A  pI2CHW_SlaveWrite_BufLO
       000B  I2CHW_SlaveWrite_Count
       000B  _I2CHW_SlaveWrite_Count
       000C  _pI2CHW_SlaveRead_BufLO
       000C  pI2CHW_SlaveRead_BufLO
       000D  I2CHW_SlaveRead_CountHI
       000D  _I2CHW_SlaveRead_CountHI
       000E  I2CHW_SlaveRead_Count
       000E  _I2CHW_SlaveRead_Count
       000F  __InterruptRAM_end
       000F  __ramareas_end

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
obj/main.o	[ main.c ]
<library>	[ pwm16int.asm, pwm16.asm, psocconfigtbl.asm, psocconfig.asm, i2chwmmsmstr.asm, i2chwmmsint.asm ]
[ i2chwmms.asm, r0.asm ]

Area Definitions

-blit:0x150.0xfff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

