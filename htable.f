needs alg/htable

with~ ~struct

41 htable mytable
:: fnvhash ; is $hash1
:: fnvhash2 ; is $hash2

mytable

: $>table
	" 543 trees" ins$
	" 823 trees" ins$
	" 333 trees" ins$
	" 273 trees" ins$
	" 587 trees" ins$
	" 234 trees" ins$
	" 384 trees" ins$
	" 847 trees" ins$
	" 382 trees" ins$
	" 748 trees" ins$
	" 374 trees" ins$
	" 999 trees" ins$
	" 788 trees" ins$
	" 839 trees" ins$
	" 922 trees" ins$
	;
: n>table
	543 ins
	823 ins
	333 ins
	273 ins
	587 ins
	234 ins
	384 ins
	847 ins
	382 ins
	748 ins
	374 ins
	999 ins
	788 ins
	839 ins
	922 ins
	;
: ?$match .s cr dup 0if drop ." no match" else count type then cr ;
: ?nmatch .s cr dup 0if drop ." no match" else @ . then cr ;
: $trees " 587 trees" fnvhash ;

$>table prt$

reset
" 839 trees" fnd$
?$match
$trees fnd
?nmatch
" 839 trees" lookup$
.s

| bye

( vim:
)
