
| variable buffer
create buffer 256 allot
32 constant bl

: space? ( char -- flag )
	dup bl =
	;

: clrbuffer " " buffer place ;
: chkbuffer buffer count type ;
: bufferfull? buffer count nip 200 > ;
: tcache dup buffer c+place ;

: test
repeat
	ekey
	space? if clrbuffer ." space " then
	tcache
	.s chkbuffer ." <" cr buffer count . . cr
	'Q <>
while
	;

reset
clrbuffer
 test
| bye

| vim: ft=reva :
