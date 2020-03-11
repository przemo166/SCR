#! /bin/bash                                                                                                                                                 
while getopts "n:m:a:" OPTION
do
  	case $OPTION in
                n) iloscDni="$OPTARG";;
                m) rozszerzenie="$OPTARG";;
                a) nazwaArch="$OPTARG";;
                *) echo "Błędna opcja"; exit 1;;
        esac
done

if [[ ! "$iloscDni" ]]
then
    	echo "Ile dni temu mial byc edytowany plik: "
        read iloscDni
fi

if [[ ! "$rozszerzenie" ]]
then
    	echo "Jakie rozszerzenie: "
	read rozszerzenie
fi

if [[ ! "$nazwaArch" ]]
then
    	echo "Jaka nazwa archiwum: "
	read nazwaArch
fi

echo ""
echo "PODANO ARGUMENTY"
echo "Ilosc dni : $iloscDni"
echo "Rozszerzenie : $rozszerzenie"
echo "Nazwa archiwum : $nazwaArch"
echo ""

pliki=$(find . -type f -name "*.$rozszerzenie" -mtime "-$iloscDni" -printf "%p ")

printf "Pliki to :\n"
tar -cvf $nazwaArch.tar $pliki
