#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
GUESS_NUM=$(($RANDOM % 1000 + 1))
echo "$GUESS_NUM"
NUM_TRIES=1
GUESS=-1

echo -e "Enter your username:"
read USERNAME

USER_EXISTS=$($PSQL "SELECT games_played, best_game FROM leaderboard WHERE username='$USERNAME'")
if [[ -z $USER_EXISTS ]]
then
  USERNAME_INSERT_RESULT=$($PSQL "INSERT INTO leaderboard(username) VALUES('$USERNAME')")
  if [[ -z $USERNAME_INSERT_RESULT ]]
  then
    echo "Error"
  else
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    echo -e "\nGuess the secret number between 1 and 1000:"
    read GUESS
    while [[ $GUESS -ne $GUESS_NUM ]]
    do
      ((NUM_TRIES++))
      if [[ ! $GUESS =~ ^[0-9]+$ ]]
      then
        echo -e "\nThat is not an integer, guess again:"
        read GUESS
      else
        if [[ $GUESS -lt $GUESS_NUM ]]; then
          echo -e "\nIt's higher than that, guess again:"
        elif [[ $GUESS -gt $GUESS_NUM ]]; then
          echo -e "\nIt's lower than that, guess again:"
        fi
        read GUESS
      fi
    done
    echo -e "\nYou guessed it in $NUM_TRIES tries. The secret number was $GUESS_NUM. Nice job!"
    UPDATE_SCORE=$($PSQL "UPDATE leaderboard SET games_played = 1, best_game = '$NUM_TRIES' WHERE username = '$USERNAME'")
  fi
else
  IFS="|" read -r PLAYED BEST <<< "$USER_EXISTS"
  echo -e "\nWelcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
  echo -e "\nGuess the secret number between 1 and 1000:"
    read GUESS
    while [[ $GUESS -ne $GUESS_NUM ]]
    do
      ((NUM_TRIES++))
      if [[ ! $GUESS =~ ^[0-9]+$ ]]
      then
        echo -e "\nThat is not an integer, guess again:"
        read GUESS
      else
        if [[ $GUESS -lt $GUESS_NUM ]]; then
          echo -e "\nIt's higher than that, guess again:"
        elif [[ $GUESS -gt $GUESS_NUM ]]; then
          echo -e "\nIt's lower than that, guess again:"
        fi
        read GUESS
      fi
    done
    echo -e "\nYou guessed it in $NUM_TRIES tries. The secret number was $GUESS_NUM. Nice job!"
    ((PLAYED++))
    if [[ $NUM_TRIES -le $BEST ]]
    then
      UPDATE_SCORE=$($PSQL "UPDATE leaderboard SET games_played = '$PLAYED', best_game = '$NUM_TRIES' WHERE username = '$USERNAME'")
    else
      UPDATE_SCORE=$($PSQL "UPDATE leaderboard SET games_played = '$PLAYED' WHERE username = '$USERNAME'")
    fi   
fi