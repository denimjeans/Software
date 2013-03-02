	.module main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_Zeiger::
	.blkb 1
	.area idata(rom,lit)
	.byte 0
	.area data(ram, con, rel)
	.dbfile ./main.c
	.dbfile H:\Hobby\PROGRA~1\PSOCPR~1\I2C_MA~1\I2C_MA~1\main.c
	.dbsym e Zeiger _Zeiger c
_Timer::
	.blkb 1
	.area idata(rom,lit)
	.byte 0
	.area data(ram, con, rel)
	.dbfile H:\Hobby\PROGRA~1\PSOCPR~1\I2C_MA~1\I2C_MA~1\main.c
	.dbsym e Timer _Timer c
_Button::
	.blkb 1
	.area idata(rom,lit)
	.byte 0
	.area data(ram, con, rel)
	.dbfile H:\Hobby\PROGRA~1\PSOCPR~1\I2C_MA~1\I2C_MA~1\main.c
	.dbsym e Button _Button c
	.area text(rom, con, rel)
	.dbfile H:\Hobby\PROGRA~1\PSOCPR~1\I2C_MA~1\I2C_MA~1\main.c
	.dbfunc e main _main fV
_main::
	.dbline 0 ; func end
	jmp .
	.dbend
	.dbfunc e Timer16 _Timer16 fV
_Timer16::
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e I2C_Init _I2C_Init fV
_I2C_Init::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Read_PSoCSlave _Read_PSoCSlave fV
;         Button -> X-5
_Read_PSoCSlave::
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l Button -5 pc
	.dbend
