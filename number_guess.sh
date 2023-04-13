#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#create to 1~1000INT
ANSWER_INT=$(($RANDOM % 1000 + 1))

#user login
USER_LOGIN() {
  echo -e "\nEnter your username:"
  read USERNAME
  USERDATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")
  if [[ -z "$USERDATA" ]]
  then #if not have userdata
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo -e "\n Welcome, $USERNAME! It looks like this is your first time here."
  else #if have userdata
    echo "$USERDATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  GAMEPLAY
}

GAMEPLAY() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nGuess the secret number between 1 and 1000:"
    TRY_COUNT=0
  fi

  read INPUT_NUMBER
  if [[ ! "$INPUT_NUMBER" =~ ^[0-9]+$ ]]
  then
    GAMEPLAY "That is not an integer, guess again:"
  fi
  TRY_COUNT=$(($TRY_COUNT+1))

  if [[ "$INPUT_NUMBER" =~ ^[0-9]+$ ]]
  then
    if [[ $INPUT_NUMBER = $ANSWER_INT ]]
    then
      echo -e "\nYou guessed it in $TRY_COUNT tries. The secret number was $INPUT_NUMBER. Nice job!"
      echo "$USERDATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
      do
        if [[ $BEST_GAME ]]
        then
          if [[ $TRY_COUNT < $BEST_GAME ]]
          then
            USERDATA_UPDATE=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $TRY_COUNT WHERE username = '$USERNAME'")
          fi
        else
          USERDATA_UPDATE=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $TRY_COUNT WHERE username = '$USERNAME'")
        fi
      done
    else if (( $INPUT_NUMBER > $ANSWER_INT ))
    then
      GAMEPLAY "\nIt's lower than that, guess again:"
    else
      GAMEPLAY "\nIt's higher than that, guess again:"
    fi
    fi
  else
    GAMEPLAY "That is not an integer, guess again."
  fi
}

USER_LOGIN
