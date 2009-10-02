#! /usr/bin/gforth

require string.fs



: &? ( addr u -- flag )  \ if string has a &,  has with -1, not with 0
    2dup                \ back up the string
    s" &" search        \ if has a &  
                        \ ( addr3   u3    flag)
    -rot                \ ( flag    addr3 u3 )
    2drop               \ ( flag )  drop 2 un-use addr3 and u3
    ;


: typi ( addr u -- string ) \ type out string with a enter
    cr
    type ;

: split_& ( addr u -- addr1 u1 addr2 u2 )
    [char] &              \ put the spliter with &
    $split ;             \ split into 2 string

: $multi-split ( addr u -- addr1 u1 ...addrn un )   \ split string with & to multi addr,n
    begin 
        split_&
        &?
        while
    repeat ;

: split_= ( addr u -- addr1 u1 addr2 u2 )
    [char] =              \ put the spliter with =
    $split ;             \ split into 2 string


: search_value ( addr1 u1 addr2 u2 -- addr3 u3 )    \ search the value with key in a paramters
    \ addr1 u1 = parameters .   ex: user=Mary&passwd=2314&sex=female
    \ addr2 u2 = key            ex: user
    search      \  =Mary&passwd=2314&sex=female -1
    if
        split_&     \  =Mary passwd=2314&sex=female
        2drop
        split_=     \ empty Mary
        2swap       \ Mary
    else
        ." we dont found the key in params"
    then

    2drop
    ;