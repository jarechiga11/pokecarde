INCLUDE "../macros.asm"
INCLUDE "../constants/scriptcommands.asm"
INCLUDE "../constants/fossils.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 20,1 ; Route 114
	db 1   ; Fossil Maniac
	GBAPTR FossilManiacScriptStart
	GBAPTR FossilManiacScriptEnd


	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart


	db END_OF_CHUNKS

FossilManiacScriptStart:
	setvirtualaddress PrinterScriptStart

	lock
	faceplayer

	virtualmsgbox Revisit
	waitmsg
	waitkeypress

	; Fossils should appear in desert again
	clearflag FLAG_HIDE_ROOT_FOSSIL
	clearflag FLAG_HIDE_CLAW_FOSSIL

	closemessage
	release
	killscript
	end

Revisit:
	Text_EN "The news said a sandstorm just\n"
	Text_EN "passed through on ROUTE 111.\p"

	Text_EN "Maybe more fossils will appear?@"

FossilManiacScriptEnd:

PreloadScriptStart:
	setvirtualaddress PreloadScriptStart

	virtualloadpointer Start
	setbyte 2
	end

Start:
	Text_EN "Go find the fossil maniac on\n"
	Text_EN "ROUTE 114.@"

DataEnd:
	EOF