| vim: ft=reva

32 constant bl

: 2tuck 2swap 2over ;
: ppad " pns 你 ix 我 pal 他 iwn 這 qe 里" pad place ;
: code-table ppad pad count ;

: findcode search drop ;
: code> swap drop 1+ /string ;
| pad count " ix" 2swap 2over .s findcode 2swap .s code> type
: code>> nip 1+ /string ;
| " pns 你 ix 我 pal 他 iwn 這 qe 里" " ix" findcode .s cr " ix" code>> .s cr 2dup bl /char .s cr nip - type

: searchcode  2tuck  findcode 2swap code>> ;
: 1stword 2dup bl /char nip - ;
| " pns 你 ix 我 pal 他 iwn 這 qe 里" " ix" searchcode 1stword type

: code-parser searchcode 1stword ;
code-table " pal" code-parser type
bye
