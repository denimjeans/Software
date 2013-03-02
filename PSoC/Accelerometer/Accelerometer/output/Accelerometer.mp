Project:      output/Accelerometer
Build Number: 0
Date:         Mon May 07 22:43:39 2012
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   00AF =    175. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0161  LoadConfigTBL_Accelerometer_Bank0
       01C4  LoadConfigTBL_Accelerometer_Bank1
       01FF  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   01FF   0004 =      4. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       01FF  __idata_start
       0203  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0203   012C =    300. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0203  LoadConfigTBL_Accelerometer_Ordered
       02C8  LoadConfigInit
       02C8  _LoadConfigInit
       02D8  LoadConfig_Accelerometer
       02D8  _LoadConfig_Accelerometer
       032F  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   032F   04CE =   1230. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       032F  _PGA_Y_Achse_SetPower
       032F  PGA_Y_Achse_Start
       032F  _PGA_Y_Achse_Start
       032F  PGA_Y_Achse_SetPower
       033D  PGA_Y_Achse_SetGain
       033D  _PGA_Y_Achse_SetGain
       035F  _PGA_Y_Achse_Stop
       035F  PGA_Y_Achse_Stop
       0363  PGA_X_Achse_Start
       0363  _PGA_X_Achse_SetPower
       0363  PGA_X_Achse_SetPower
       0363  _PGA_X_Achse_Start
       0371  PGA_X_Achse_SetGain
       0371  _PGA_X_Achse_SetGain
       0393  _PGA_X_Achse_Stop
       0393  PGA_X_Achse_Stop
       0397  LCD_PrCString
       0397  _LCD_PrCString
       03A9  LCD_HEX_STR
       03B9  _LCD_PrHexByte
       03B9  LCD_PrHexByte
       03CC  _LCD_PrHexInt
       03CC  LCD_PrHexInt
       03D3  LCD_PrString
       03D3  _LCD_PrString
       03DD  LCD_Write_Data
       03DD  _LCD_Write_Data
       03DD  LCD_WriteData
       03DD  _LCD_WriteData
       03F1  LCD_Control
       03F1  _LCD_Control
       0498  _LCD_Init
       0498  LCD_Start
       0498  _LCD_Start
       0498  LCD_Init
       0504  LCD_ROW_OFFSET
       0508  _LCD_Position
       0508  LCD_Position
       0514  LCD_Delay50uTimes
       0514  _LCD_Delay50uTimes
       051A  LCD_Delay50u_Table
       0522  _LCD_Delay50u
       0522  LCD_Delay50u
       0536  LCD_DrawBG
       055C  _LCD_DrawBG
       0585  LCD_DrawVBG
       05B2  _LCD_DrawVBG
       05E2  LCD_InitVBG
       05E2  _LCD_InitVBG
       060F  LCD_BG_TYPE1
       0616  LCD_BG_TYPE2
       061D  LCD_InitBG
       061D  _LCD_InitBG
       065B  _DUALADC_CNT1_ISR
       065E  _DUALADC_CNT2_ISR
       0661  _DUALADC_PWM16_ISR
       071F  _DUALADC_Start
       071F  _DUALADC_SetPower
       071F  DUALADC_SetPower
       071F  DUALADC_Start
       0742  DUALADC_Stop
       0742  _DUALADC_Stop
       0749  _DUALADC_GetSamples
       0749  DUALADC_GetSamples
       0789  _DUALADC_StopAD
       0789  DUALADC_StopAD
       07AA  DUALADC_fIsData
       07AA  DUALADC_fIsDataAvailable
       07AA  _DUALADC_fIsData
       07AA  _DUALADC_fIsDataAvailable
       07AF  DUALADC_iGetData1ClearFlag
       07AF  _DUALADC_iGetData1ClearFlag
       07B7  _DUALADC_iGetData1
       07B7  DUALADC_iGetData1
       07BC  _DUALADC_iGetData2ClearFlag
       07BC  DUALADC_iGetData2ClearFlag
       07C4  _DUALADC_iGetData2
       07C4  DUALADC_iGetData2
       07C9  DUALADC_ClearFlag
       07C9  _DUALADC_ClearFlag
       07CD  DUALADC_SetResolution
       07CD  _DUALADC_SetResolution
       07FD  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   07FD   0087 =    135. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       07FD  __text_start
       07FD  _main
       0884  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0000  _Position_X_Achse
       0002  _Position_Y_Achse
       0004  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0004   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0004  __r0
       0005  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0005   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0005  _NO_SHADOW
       0005  _Port_4_Data_SHADE
       0005  NO_SHADOW
       0005  Port_4_Data_SHADE
       0006  Port_4_DriveMode_0_SHADE
       0006  _Port_4_DriveMode_0_SHADE
       0007  Port_4_DriveMode_1_SHADE
       0007  _Port_4_DriveMode_1_SHADE
       0008  DUALADC_cCounter1U
       0009  DUALADC_cCounter2U
       000A  DUALADC_iResult1
       000A  _DUALADC_iResult1
       000C  _DUALADC_iResult2
       000C  DUALADC_iResult2
       000E  DUALADC_bfStatus
       000E  _DUALADC_bfStatus
       000F  DUALADC_bSampC
       0010  __InterruptRAM_end
       0010  __ramareas_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   00DA =    218. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       00D7  _bGetPowerSetting
       00D7  bGetPowerSetting

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ psocconfigtbl.asm, psocconfig.asm, pga_y_achse.asm, pga_x_achse.asm, lcd.asm, dualadcint.asm ]
[ dualadc.asm, r0.asm ]

Area Definitions

-blit:0x150.0x3fff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

