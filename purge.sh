
#!/bin/bash

init(){
MAIL_RECEIVE="abdellah.abair@gmail.com"
NOM_REP="/opt/logs"
BATCHFAC="/home/aabair/factures"
}
comande()
{
cmd=$1
if [[ $cmd == "-h" || $cmd == "-H" ]]
then
echo "-HELP"
echo "Format du fichier doit étre comme ça :X_YearMMDay_numfac_numcentre.gz  exemple :(AVC_20191201_8876_1122.gz)"
fi
}

Year=$(date +'%Y')

Month=$(date +'%m')

if [[ $Month == "01" ]]
then
Year=$((Year - 1))
DIFF=12
else
DIFF=$((Month - 1))
fi

CENTRE=`hostname`

echo -e "Le Script de purge des factures sur le centre numero $CENTRE à $Year/$Month\n"

##PURGE sur le repertoire /home/x/factures
##FORMAT du ficher que on veut deplacer vers /opt/logs/X est :AVC_20191201_8876_1122.gz
DEF_BORNE=$Year$DIFF
search_name(){

name=$1

case $name in
        AVC) search_name1="AVC_$DEF_BORNE[0-9][0-9]_*";;
        DVC)search_name1="DVC_$DEF_BORNE[0-9][0-9]_*" ;;
        FAC) search_name1="FAC_$DEF_BORNE[0-9][0-9]_*";;

        
esac
}

init
if [ ! -d /opt/logs/$DEF_BORNE ] ; then
 mkdir $NOM_REP/$DEF_BORNE
fi
for rep1 in `ls -l $BATCHFAC | grep -e AVC -e DVC -e  FAC | awk '/^d/ {print $NF}'`
do
   search_name $rep1
   rep=$BATCHFAC"/"$rep1
if [ ! -d $NOM_REP/$DEF_BORNE/$rep1 ] ; then
 mkdir $NOM_REP/$DEF_BORNE/$rep1
fi
    echo $search_name1
for FlKb in `find $rep -name $search_name1 -ls 2>/dev/null| nawk '{print $11}'`
do
      echo "Deplacer $FlKb vers $NOM_REP/$DEF_BORNE/$rep1"
      mv $FlKb $NOM_REP/$DEF_BORNE/$rep1

done

done

echo -e " Bonjour tout le monde,voici le purge du mois $DIFF dans l'anne $Year .C'.\n\nPour info: tous les fichiers qui sont purge ,ils ont depalace vers $NOM_REP/$DEF_BORNE.\n\n"  2>&1 | tee SomeFile.txt
sed -i '$a 20270 Casablanca www.abdellah_abair.com People matter, results count.\n' SomeFile.txt

FROM="x"
TO="y"
SUBJECT="Purge des factures sur le centre numero $CENTRE à $DIFF/$Year"
MSG=`cat SomeFile.txt`
rm -rf SomeFile.txt
mail -s $SUBJECT -r $x $y < SomeFile.txt

