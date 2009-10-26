| --luneIME.f--
| --Lune IME main source--

| --libs--
needs ./engine.f

| 輸入緩沖區 tbuffer, 下面 tb. 的 words 就是緩沖區操作
create tbuffer 256 allot

: space? ( char -- flag )
	dup bl = 
	;
| tb = tbuffer 
| 輸入緩沖區
: tb.cache ( -- )
	dup tbuffer c+place
	;
: tb.full? ( -- )
	tbuffer count nip 30 >
	;

| tb.clr empty tbuffer
: tb.clr ( -- )
	" " tbuffer place
	;
: tb.chk ( -- )
	tbuffer count type
	;
: debug ( -- )
	.s tbuffer count . . tb.chk ." <" cr
	;

: decode ( -- a n )
	$table tbuffer count parser
	tb.clr
	;

: (luneIME) ( -- )
repeat
	ekey
	| -- 回顯
	dup emit 
	| -- 把處理輸入和查碼表等
	tb.cache
	space? if decode type cr then
	tb.full? if tb.clr then
	| debug
	| -- 如果大寫 Q 退出
	'Q <> 
while
	;

: luneIME ( -- )
." 按大寫 Q 退出，現有碼表: " cr
$table type cr
(luneIME)
	;

reset
tb.clr
	luneIME
bye

| vim: ft=reva :
