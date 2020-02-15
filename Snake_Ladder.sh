#!/bin/bash
Player1=0
dice=$$
rollDice(){
	dice=$(( $((RANDOM%6))+1 ))
	echo "Dice: $dice"
}

option=$$
checkOptions(){
	option=$((RANDOM%3))
	if((option==0))
	then
		echo "No Play"
		Player1=$Player1
	elif((option==1))
	then
		echo "Ladder"
		Player1=$((Player1+dice))
	else
		echo "Snake"
		Player1=$((Player1-dice))
	fi
}

count=0
while((Player1<100))
do
	rollDice
	checkOptions
	if((Player1<0))
	then
		Player1=0
	fi
	if((Player1>100))
	then
		Player1=$((Player1-dice))
	fi
	echo "Player1: $Player1"
	count=$((count+1))
done
echo "Total number of times Dice rolled: $count"