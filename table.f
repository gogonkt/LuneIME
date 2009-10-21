( table.f
 noseeing encode table
 嘸啥味 編碼碼表
 This file should auto generate by cin2table )

( 表結構:
	: $table-$encodestring ." font1 font2 font3 ..." ;
for example:
	: fuzzy-nihao ." 你好 泥號" ; )

( Note: 把 cin 碼表讀入 hash table 供 engine 使用 )
needs string/misc
~strings

256 value filesize
256 value buffersize
create tablename buffersize allot
| " minitab.cin" tablename place
" noseeing.cin" tablename place

( htable: table file handle )
0 value htable
( btable: table buffer )
filesize allocate constant btable 

( debug )
: debug ." debug -----------------" cr
	." tablename : " tablename . cr
	." filesize : " filesize . cr
	." btable : " btable . cr
	." -----------------------" cr cr
	;

: ?err ioerr @ 0if ." done" cr then ;
: .tablename ( -- ) tablename count type ."  " ;

: create_table ( cst -- n ) count creat ( ."      " .tablename ." create: " ?err ) ;
: opentable/rw ( cst -- n ) count open/rw ( ."      " .tablename ." open/rw: " ?err ) ; 
: closetable ( -- )
	htable close
		."      " .tablename ." close: " ?err
		;

( ppad -- 把臨時小碼表放入 pad )
: ppad ( -- )
	" pns 你 ix 我 pal 他 iwn 這 qe 里" 
	pad place ;
: loadtable ( -- ) ppad ;
: writetable ( -- )
	cr cr
	tablename opentable/rw
		to htable
	loadtable
	pad count htable write
		." write " pad count . drop ." bytes to " .tablename cr
		."      " .tablename ." write: " ?err
	closetable
	;

: test1 ( -- ) 
	cr
	tablename opentable/rw
		dup to htable
		fsize to filesize
	btable filesize htable read
	cr .tablename ." content:" cr
	btable swap type cr cr
	closetable
	;

tablename opentable/rw
	to htable
	htable fsize to filesize
	filesize allocate constant tbuffer
	.tablename ." size: " filesize . ." <<" cr
tbuffer filesize htable read
| tbuffer filesize type cr

: testsplit ( -- )
	btable filesize splitws .s ;

.~

| bye

( vim: ft=reva : 
)
