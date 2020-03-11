#!/bin/bash 

# Nadajemy tytuł naszym wiadomosciom
SUBJECT="Zapytanie ofertowe"
# Wskazujemy ich tresc
EMAILBODY="/home/pwidz/SKRYPTY/email/tresc.txt"
# Zmienna przechowujaca sciezke do pliku z adresami
plik="/home/pwidz/SKRYPTY/email/adresy.txt"

read $plik
if [ ! -r $plik ];
then
    echo "Nie moge czytac z pliku $plik"
    exit 1
fi
cat $plik | while read linia
do
    echo $linia
    mutt -s "oferta handlowa" $linia <$EMAILBODY -a spec*.pdf
done
