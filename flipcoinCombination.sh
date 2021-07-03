#!/bin/bash -x

HHH=0
HHT=0
HTT=0
TTT=0
TTH=0
THH=0
HTH=0
THT=0

declare -A triplet
read -p "Enter the simulation number : " n
i=0
while [[ $i != $n ]]
do
   flipcoin1=$((RANDOM%2))
   flipcoin2=$((RANDOM%2))
   flipcoin3=$((RANDOM%2))
   if [[ ($flipcoin1 == 1) && ($flipcoin2 == 1) && ($flipcoin3 == 1) ]]
   then
      HHH=$(($HHH + 1))
   elif [[ ($flipcoin1 == 1) && ($flipcoin2 == 1) && ($flipcoin3 == 0) ]]
   then
      HHT=$(($HHT + 1))
   elif [[ ($flipcoin1 == 1) && ($flipcoin2 == 0) && ($flipcoin3 == 0) ]]
   then
      HTT=$(($HTT + 1))
   elif [[ ($flipcoin1 == 0) && ($flipcoin2 == 0) && ($flipcoin3 == 0) ]]
   then
      TTT=$(($TTT + 1))
   elif [[ ($flipcoin1 == 0) && ($flipcoin2 == 0) && ($flipcoin3 == 1) ]]
   then
      TTH=$(($TTH + 1))
   elif [[ ($flipcoin1 == 0) && ($flipcoin2 == 1) && ($flipcoin3 == 1) ]]
   then
      THH=$(($THH + 1))
   elif [[ ($flipcoin1 == 1) && ($flipcoin2 == 0) && ($flipcoin3 == 1) ]]
   then
      HTH=$(($HTH + 1))
   elif [[ ($flipcoin1 == 0) && ($flipcoin2 == 1) && ($flipcoin3 == 0) ]]
   then
      THT=$(($THT + 1))
   fi
   ((i++))
done

triplet[HHH]=`echo "scale = 2; ($HHH/$n)*100" | bc`
triplet[HHt]=`echo "scale = 2; ($HHT/$n)*100" | bc`
triplet[HTT]=`echo "scale = 2; ($HTT/$n)*100" | bc`
triplet[TTT]=`echo "scale = 2; ($TTT/$n)*100" | bc`
triplet[TTH]=`echo "scale = 2; ($TTH/$n)*100" | bc`
triplet[THH]=`echo "scale = 2; ($THH/$n)*100" | bc`
triplet[HTH]=`echo "scale = 2; ($HTH/$n)*100" | bc`
triplet[THT]=`echo "scale = 2; ($THT/$n)*100" | bc`

echo triplet combinations ${!triplet[@]}
echo combination percentages ${triplet[@]}
