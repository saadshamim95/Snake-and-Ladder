#!/bin/bash
echo "********************************************"
echo "       WELCOME TO SNAKE & LADDER GAME       "
echo "********************************************"

declare -a snakeBitten
declare -a snakeEnd
declare -a ladderStart
declare	-a ladderReach

snakeBitten=(99 97 89 76 73 66 59 50 39 35 27)
snakeEnd=(26 86 67 63 12 24 46 34 3 5 7)
ladderStart=(2 7 22 30 44 54 70 80 87)
ladderReach=(23 29 41 32 58 69 90 83 93)

initialize(){
	value=100
	echo "____ ____ ____ ____ ____ ____ ____ ____ ____ ____"
	for((i=0;i<10;i++))
	do
		if((i!=0))
		then
			echo -n " "
		fi
	
		if(( $((i%2))==0))
		then
			if((i!=0))
			then
				value=$((value-11))
			fi
		else
			value=$((value-9))
		fi
	
		temp=10
		while((temp!=0))
		do
			if(( $((i%2))==0 ))
			then
				printf "$value | "
				value=$((value-1))
				temp=$((temp-1))
			else
				if((value<10))
				then
					echo -n " "
				fi
				printf "$value | "
				value=$((value+1))
				temp=$((temp-1))
			fi
		done
		echo ""
		echo "____ ____ ____ ____ ____ ____ ____ ____ ____ ____"
	done
	
	echo ""
	echo "Snake Bite   : ${snakeBitten[@]}"
	echo "Snake End    : ${snakeEnd[@]}"
	echo "Ladder Start : ${ladderStart[@]}"
	echo "Ladder Reach : ${ladderReach[@]}"
}

initialize

echo ""
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
	if((Player1<0))
	then
		Player1=0
	fi
	echo "Player1: $Player1"
done
