#!/bin/bash

rozszerzenie=$1
n_dni=$2
nazwa_archiwum=$3

pliki=$(find . -type f -name "*.$rozszerzenie" -mtime "-$n_dni" -printf "%p ")

tar -cvf $nazwa_archiwum.tar $pliki

