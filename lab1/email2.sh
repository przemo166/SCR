#!/bin/bash

# Nadajemy tytuł naszym wiadomosciom
SUBJECT="Zapytanie ofertowe"
# Wskazujemy ich tresc
EMAILBODY="/home/pwidz/SKRYPTY/email/tresc.txt"
# Zmienna przechowujaca sciezke do pliku z adresami
plik="/home/pwidz/SKRYPTY/email/adresy.txt"

# Przeszukiwanie wszystkich plików i dodawanie ich do zalacznikow
declare -a attargs
for att in $(find . -type f -name "spec*.pdf"); do
    attargs+=( "-a"  "$att" )
    done

read $plik
if [ ! -r $plik ];
then
    echo "Nie moge czytac z pliku $plik"
    exit 1
fi
cat $plik | while read linia
do
    echo $linia
    mail -s "$SUBJECT" "${attargs[@]}" $linia <$EMAILBODY
done
