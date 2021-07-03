#!/bin/bash -x

read -p "Enter the simulation number : " n

Heads=0
Tails=0

declare -A singlet
i=0
while [[ $i != $n ]]
do
   flipcoin=$((RANDOM%2))
   case $flipcoin in
      1)
         Heads=$(($Heads + 1))
      ;;
      0)
         Tails=$(($Tails + 1))
      ;;
   esac
   ((i++))
done

singlet[H]=`echo "scale = 1; ($Heads/$n)*100" | bc`
singlet[T]=`echo "scale = 1; ($Tails/$n)*100" | bc`

echo singlet combinations ${!singlet[@]}
echo singlet percentages  ${singlet[@]}

HH=0
HT=0
TH=0
TT=0

declare -A doublet
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


doublet[HH]=`echo "scale = 1; ($HH/$n)*100" | bc`
doublet[HT]=`echo "scale = 1; ($HT/$n)*100" | bc`
doublet[TH]=`echo "scale = 1; ($TH/$n)*100" | bc`
doublet[TT]=`echo "scale = 1; ($TT/$n)*100" | bc`

echo doublet combinations ${!doublet[@]}
echo combination percentages ${doublet[@]}

HHH=0
HHT=0
HTT=0
TTT=0
TTH=0
THH=0
HTH=0
THT=0

declare -A triplet
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

triplet[HHH]=`echo "scale = 1; ($HHH/$n)*100" | bc`
triplet[HHt]=`echo "scale = 1; ($HHT/$n)*100" | bc`
triplet[HTT]=`echo "scale = 1; ($HTT/$n)*100" | bc`
triplet[TTT]=`echo "scale = 1; ($TTT/$n)*100" | bc`
triplet[TTH]=`echo "scale = 1; ($TTH/$n)*100" | bc`
triplet[THH]=`echo "scale = 1; ($THH/$n)*100" | bc`
triplet[HTH]=`echo "scale = 1; ($HTH/$n)*100" | bc`
triplet[THT]=`echo "scale = 1; ($THT/$n)*100" | bc`

echo triplet combinations ${!triplet[@]}
echo combination percentages ${triplet[@]}

counter1=0
for i in ${singlet[@]}
do
	singletArr[((counter1++))]=$i
done

counter2=0
for i in ${doublet[@]}
do
	doubletArr[((counter2++))]=$i
done

counter3=0
for i in ${triplet[@]}
do
	tripletArr[((counter3++))]=$i
done

echo ${singletArr[@]}
echo ${doubletArr[@]}
echo ${tripletArr[@]}
