" libvte.so" lib libvte
libvte not [IF] ." load libvte failed..." cr -1 throw [THEN]

0 func: vte_terminal_new
8 func: vte_terminal_fork_command

needs ui/gtk2
~gtk2

: =exit callback gtk_main_quit ;
: main ( -- ) init
    GTK_WINDOW_TOPLEVEL gtk_window_new dup dup
    vte_terminal_new
    dup 0 0 0 0 0 0 0 vte_terminal_fork_command drop
    2dup _add
    z" child-exited" ['] =exit _connect drop
    z" delete-event" ['] =exit _connect drop
    gtk_widget_show_all gtk_main ;
main bye