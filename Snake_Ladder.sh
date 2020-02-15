#!/bin/bash
Player1=0
Player2=0

dice=$$
rollDice(){
	dice=$(( $((RANDOM%6))+1 ))
	echo "Dice: $dice"
}

option=$$
checkOptions(){
	player=$1
	option=$((RANDOM%3))
	if((option==0))
	then
		echo "No Play"
		if(($player==1))
		then
			Player1=$Player1
		else
			Player2=$Player2
		fi
	elif((option==1))
	then
		echo "Ladder"
		if(($player==1))
		then
			Player1=$((Player1+dice))
			if((Player1>100))
			then
				Player1=$((Player1-dice))
			fi
		else
			Player2=$((Player2+dice))
			if((Player2>100))
			then
				Player2=$((Player2-dice))
			fi
		fi
	else
		echo "Snake"
		if(($player==1))
		then
			Player1=$((Player1-dice))
			if((Player1<0))
			then
				Player1=0
			fi
		else
			Player2=$((Player2-dice))
			if((Player2<0))
			then
				Player2=0
			fi
		fi
	fi
}

count=0
while((Player1<100 && Player2<100))
do
	if(( $((count%2))==0 ))
	then
		rollDice
		checkOptions 1
		echo "Player1: $Player1"
		if((Player1==100))
		then
			echo "Player 1 Won!!!"
		fi
	else
		rollDice
		checkOptions 2
		echo "Player2: $Player2"
		if((Player2==100))
		then
			echo "Player 2 Won!!!"
		fi
	fi
	count=$((count+1))
done
echo "Total number of times Dice rolled: $count"