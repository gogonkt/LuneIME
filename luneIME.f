| --luneIME.f--
| --Lune IME main source--

| --libs--
needs ./engine.f

: (luneIME) ( -- )
repeat
	ekey dup emit 
	| -- 如果大寫 Q 退出
	'Q <> 
while
;

: luneIME ( -- )
(luneIME)
;

luneIME
bye

| vim: ft=reva :
