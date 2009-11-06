: main ( -- ) init
    GTK_WINDOW_TOPLEVEL gtk_window_new dup dup
    vte_terminal_new
    dup 0 0 0 0 0 0 0 vte_terminal_fork_command drop
    2dup _add
    z" child-exited" ['] =exit _connect drop
    z" delete-event" ['] =exit _connect drop
    gtk_widget_show_all gtk_main ;