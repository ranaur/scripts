#!/bin/sh
DU_OPTS="--apparent-size -m"
if [ $# = 0 ] ; then
        for t in * ; do
                du $DU_OPTS "./$t" | tail -1
        done
else
        for t in "$@" ; do
                du $DU_OPTS "./$t" | tail -1
        done
fi

