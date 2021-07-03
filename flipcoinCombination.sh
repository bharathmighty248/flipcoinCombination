#!/bin/bash -x

Heads=0
Tails=0

declare -A singlet
read -p "Enter the simulation number : " n
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

singlet[H]=`echo "scale = 2; ($Heads/$n)*100" | bc`
singlet[T]=`echo "scale = 2; ($Tails/$n)*100" | bc`

echo singlet combinations ${!singlet[@]}
echo singlet percentages  ${singlet[@]}
