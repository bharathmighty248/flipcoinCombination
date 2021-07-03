#!/bin/bash -x

HH=0
HT=0
TH=0
TT=0

declare -A doublet
read -p "Enter the simulation number : " n
i=0
while [[ $i != $n ]]
do
   flipcoin1=$((RANDOM%2))
   flipcoin2=$((RANDOM%2))
   if [[ ($flipcoin1 == 1) && ($flipcoin2 == 1) ]]
   then
      HH=$(($HH + 1))
   elif [[ ($flipcoin1 == 1) && ($flipcoin2 == 0) ]]
   then
      HT=$(($HT + 1))
   elif [[ ($flipcoin1 == 0) && ($flipcoin2 == 1) ]]
   then
      TH=$(($TH + 1))
   elif [[ ($flipcoin1 == 0) && ($flipcoin2 == 0) ]]
   then
      TT=$(($TT + 1))
   fi
   ((i++))
done


doublet[HH]=`echo "scale = 2; ($HH/$n)*100" | bc`
doublet[HT]=`echo "scale = 2; ($HT/$n)*100" | bc`
doublet[TH]=`echo "scale = 2; ($TH/$n)*100" | bc`
doublet[TT]=`echo "scale = 2; ($TT/$n)*100" | bc`

echo doublet combinations ${!doublet[@]}
echo combination percentages ${doublet[@]}
