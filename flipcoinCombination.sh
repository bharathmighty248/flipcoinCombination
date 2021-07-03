#!/bin/bash -x

coinFlip=$((RANDOM%2))

if [ $coinFlip -eq 1 ]
then
	echo Heads
elif [ $coinFlip -eq 0 ]
then
	echo Tails
fi
