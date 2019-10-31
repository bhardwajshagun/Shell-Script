#!/bin/bash

# Problem Statement: Print the number of wins in each Cincinnati Bengals season since 2000,
#		     and determine the number of winning seasons (each season has 16 games).
# Note: can be shared on our Piazza board


# printWins: a function that takes in 2 parameters:
#		filename: the file that stores the number of wins
#		year: the starting season year
#	does: prints out the season year and the number of wins that season
printWins(){
	#printf can be used to print a string, but doesn't create
	#a new line automatically, which is why we need "\n"
	printf "Cincinnati Bengals Wins by Season\n"
	#creates a local variable "year" and assigns it to the 2nd
	#parameter, which is called by the "$2"
	local year=$2
	#while loop that reads each line from the file
	while read -r line; do
		#echo can be used to print a string, and it does 
		#automatically add a new line
		#"${}" is used to access the variable
		echo "${year}: ${line}"
		#increments year in with each iteration
		#"let" is a command to execute the incrementation
		let year++
	#loops through the filename, which is "$1"
	#"$1" is the filename because it is the 1st parameter
	done < $1
}

# winningSeasons: a function that takes in 1 parameter:
#			filename: the file that stores the number of wins
#	does: calculates the number of winning seasons (9 or more wins)
#	returns: number of winning seasons
winningSeasons(){
	#initializes local variable counter to 0
	local total=0
	#while loop to reac file by line
	while read -r line;do
		#if statement to check if number of wins is greater than 8
		if [ $line -gt 8 ]
		#execute following code if wins is greater than 8
		then
			#incerement total counter
			let total++
		#closes the if statement
		fi
	#loops through the filename
	done < $1
	#returns total
	echo $total
}

#calls printWins function with 2 arguments:
#	bengalsWins.txt - filename that holds wins
#	2000 - starting season
printWins bengalsWins.txt 2000

#calls winningSeasons function with 1 argument:
#	bengalsWins.txt - filename that holds wins
#returns total and assigns it to winSeasons variable
winSeasons=$(winningSeasons bengalsWins.txt)

#prints the number of winning seasons
echo "Number of winning seasons: $winSeasons"

