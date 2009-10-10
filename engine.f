| --engine.f--------
| --Lune IME egine--

| --load table.f: IME table file, chs: 直接查字表--
| --load fuzzy-table.f IME table file for fuzzy, chs: 模糊搜索表，用於實時提示
needs ./table.f

loadtable

32 constant bl
: getnext ( -- )
	bl split 3drop
	bl split drop
	; | 還要加入是否成功

: $table ( -- a n )
	pad count
	;

| locate  <index word> in tstr
: find$ ( a1 n1 a2 n2 -- a3 n3 | " no string!" )
	search
	if
		getnext 2swap 2drop
	else
		" ?" 
	then
	;

| --parser: 由編碼查出字或詞組----
: parser ( a1 n1 -- a2 n2 )
	| -- ( s1 -- word ) 
    | -- call: $encodestring parse string to font
	| -- chs: 調用碼表程序解碼，給出對應的字
	| -- FIXME: 怎麼 call encodestring 對應的 word
	find$
    ;

| -- vim: ft=reva
