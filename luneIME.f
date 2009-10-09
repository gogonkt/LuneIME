| --luneIME.f--
| --Lune IME main source--

| --libs--
needs ./engine.f

variable buffer

: space? ( char -- flag )
	dup bl = 
	;

: cacheit ( char -- )
	dup buffer c+place
	;

: decode ( char -- )
	;

: (luneIME) ( -- )
repeat
	ekey
	| -- 回顯
	dup emit 
	| -- 把處理輸入和查碼表等
	space? if decode else cacheit then
	| -- 如果大寫 Q 退出
	'Q <> 
while
	;

: luneIME ( -- )
." 按大寫 Q 退出，現有碼表: " cr
$table type cr
(luneIME)
	;

: clrbuffer " " buffer place ;
: chkbuffer buffer count type ;
: test repeat ekey space? if clrbuffer .s ." clr" else cacheit .s ." cached" then .s chkbuffer .s cr 'Q <> while ;
reset
test
| luneIME
| bye

| vim: ft=reva :
