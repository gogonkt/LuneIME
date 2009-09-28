/--engine.f--------
/--Lune IME egine--

/--load table.f: IME table file, chs: 直接查字表--
/--load fuzzy-table.f IME table file for fuzzy, chs: 模糊搜索表，用於實時提示
require ./table.f
require ./fuzzy-table.f

/--parser: 由編碼查出字或詞組----
: parser ( s1 -- word ) 
    /--call $table-$encodestring parse string to font
	/--chs: 調用碼表程序解碼，給出對應的字
	/-- FIXME: 怎麼 call encodestring 對應的 word
	table-pns
    ;

/-- vim: ft=forth:
