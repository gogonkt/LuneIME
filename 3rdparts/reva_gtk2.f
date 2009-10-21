: build-ui ( obj-addr -- )
    dup z" test gtk window" .title
    dup .======== dup >r _add ( add vbox )
        r@ z" label" .label
        .--------
        r@ z" button" .labelbtn dup
            z" clicked" ['] =exit _connect drop
        .--------
        rdrop ( R: vbox-addr -- )
    .showall
    ;
