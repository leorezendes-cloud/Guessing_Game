#!/bin/bash


echo "============================"
echo "       Guessing Game"
echo "============================"
echo ""
echo "I'm thinkin' of a number between 1 and 10."
secret_number=$(( RANDOM % 10+1 ))
attempts=3
min_allowed=1
max_allowed=10

while [ $attempts -gt 0 ];
do
   read -p "Enter your guess:" guess

   if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
      echo "I said NUMBER!!!"
      echo "Yes, this counts as a turn"
   elif [ "$guess" -gt "$max_allowed" ]; then
      echo "I said LOWER!!! you really are too high"
      echo "I'm scared to ask you to try again"
   elif [ "$guess" -lt "$min_allowed" ]; then
      echo "C'mon bro, Really??"  
      echo "'Can we get much higher' - Kanye Voice"
   elif [ "$guess" -eq "$secret_number" ]; then
      echo "BRAVO!!!! It was $secret_number"
      echo "And guess what you guessed???: $guess"
        break
   elif [ "$guess" -gt "$secret_number" ]; then
      echo "Nahh Son,Unfortunately you guessed: $guess"
      echo "You're too high ..(said no one ever)"
      echo "Try again"
      max_allowed=$(( $guess - 1 ))
   elif [ "$guess" -lt "$secret_number" ]; then
      echo "Nahh Son,Unfortunately you guessed: $guess"
      echo "Too low, if I were you, I'd get higher"
      echo "Try again"
      min_allowed=$(( $guess + 1 ))
 fi
    attempts=$(( attempts -1))
done

if [ $attempts -eq 0 ]; then
     echo "Kick Rock KIDD!!!"
     echo "Game Over Chump!!!"
     echo "The Secret Number was: $secret_number"
fi
