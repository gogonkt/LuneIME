( table.f
 noseeing encode table
 嘸啥味 編碼碼表
 This file should auto generate by cin2table )

( Note: 把 cin 碼表讀入 hash table 供 engine 使用 )
needs string/misc
needs string/trim
needs util/eachline
| needs common.f
~strings

256 value filesize
32 constant bl
create tablename 128 allot
" minitab.cin" tablename place

| " noseeing.cin" tablename place

( htable: table file handle )
0 value htable

| : ?err ioerr @ 0if ." done" cr then ;
: ?err ioerr @ 0if ;
: .tablename ( -- ) tablename count type_ ;

: create_table ( cst -- n ) count creat ( ."      " .tablename ." create: " ?err ) ;
: opentable/rw ( cst -- n ) count open/rw ( ."      " .tablename ." open/rw: " ?err ) ; 
: closetable ( -- )
	close
		."      " .tablename ." close: " ?err
		;

: loadtable ( -- )
	tablename opentable/rw
		>r ( store tablefile handle )
	r@ fsize r@ read
	?err cr .tablename ." loaded, size: " r@ fsize . ." <<" cr
		then
	r@ close drop
	rdrop
	;

: .>typecr ." >" trim type ." <" cr ;
: splitline trim 10 split drop trim ;
: splitbl bl split drop trim ;
: split# '# split drop trim ;

reset
( btable: table buffer )
tablename opentable/rw 
	dup fsize to filesize
	filesize allocate constant btable 
	create tbuffer
	close
btable loadtable

( 
btable filesize splitline
2dup .>typecr
)

( remove Comments )
( split# 
2nip
2dup .>typecr
splitbl
" " pad place
2dup pad +place
.>typecr
2dup pad +place
.>typecr
pad count .>typecr
)
btable count ['] .>typecr eachline

.s

( vim: ft=reva : 
)
