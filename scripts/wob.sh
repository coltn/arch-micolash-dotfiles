#!/bin/bash
if test -e /tmp/wobpipe; then 
    rm /tmp/wobpipe
    mkfifo /tmp/wobpipe
    tail -f /tmp/wobpipe | wob&
else
    mkfifo /tmp/wobpipe
    tail -f /tmp/wobpipe | wob&
fi
