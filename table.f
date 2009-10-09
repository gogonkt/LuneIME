| -- table.f
| -- noseeing encode table
| -- 嘸啥味 編碼碼表
| -- This file should auto generate by cin2table

| --表結構:
| --: $table-$encodestring ." font1 font2 font3 ..." ;
| --for example:
| --: fuzzy-nihao ." 你好 泥號" ;
|
| Note: 把 cin 碼表讀入 hash table 供 engine 使用

: table-pns ." 你 倧 傧 您" ;

| ppad -- 把臨時小碼表放入 pad
: ppad ( -- )
	" pns 你 ix 我 pal 他 iwn 這 qe 里" 
	pad place 
	;

: loadtable ( -- ) 
	ppad 
	;

| -- vim: ft=reva :
