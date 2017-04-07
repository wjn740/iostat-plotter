#!/bin/bash

WD=`pwd`
i=0;
for d in $(find . -type d)
do 
    pushd $d; 
    let i++; 
    if [ -e iostat ];then 
        a=$(($i%8)); 
        if [ $a -eq 0 ];then 
            wait
        else 
            ${WD}/iostat_plotter_v3.py ./iostat&
        fi
    fi
    popd
done

