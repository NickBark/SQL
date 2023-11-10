#!/bin/bash

first=${1:--1}
second=${2:-0}

for ((i = 0; i < $1 + 1; i++)); do
    if [[ $i > 9 ]]; then
        mkdir ex$i && touch "ex$i/day0$2_ex$i.sql"
    else
        mkdir ex0$i && touch "ex0$i/day0$2_ex0$i.sql"
    fi  
done
