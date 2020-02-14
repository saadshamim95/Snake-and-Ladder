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

while((Player1<100))
do
	rollDice
	checkOptions
	echo "Player1: $Player1"
done