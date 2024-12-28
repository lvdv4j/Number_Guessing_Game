#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=game_info --tuples-only -c"

#Get the username
echo "Enter your username:"
read USERNAME

#Check if the username is in the database
USER_CHECK=$($PSQL "SELECT username, games_played, best_game FROM user_info WHERE username = '$USERNAME';")

#If not in the database, add it
if [[ -z "$USER_CHECK" ]]
then
  # If the username doesn't exist, welcome the user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert the username into the database with initial values
  INSERT_RESULT=$($PSQL "INSERT INTO user_info(username, games_played, best_game) VALUES ('$USERNAME', 0, 0);")
else
  #If is in the database, welcome back
  # If the username exists, print the welcome back message
  read USERNAME BAR DB_GAMES_PLAYED BAR DB_BEST_GAME <<< "$USER_CHECK"
  echo "Welcome back, $USERNAME! You have played $DB_GAMES_PLAYED games, and your best game took $DB_BEST_GAME guesses."
fi

#Generate random number
RANDOM_NUMBER=$((RANDOM % 1000 + 1))

#Allow user to guess and check if guess is correct (loop)
GUESSES=0
echo "Guess the secret number between 1 and 1000:"

while true
do
  #Prompt user for the guess
  read GUESS

  # Check if the guess is a valid integer
  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment the guess count
  ((GUESSES++))

  # Check if the guess is correct
  if [[ "$GUESS" -eq "$RANDOM_NUMBER" ]]; then
    echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    # Update the user's games played and best game (if applicable)
    if [[ "$DB_GAMES_PLAYED" -gt 0 ]]; then
      # Update the total games played
      NEW_GAMES_PLAYED=$((DB_GAMES_PLAYED + 1))
      # Update best game if the current guess count is better (less guesses)
      if [[ "$GUESSES" -lt "$DB_BEST_GAME" || "$DB_BEST_GAME" -eq 0 ]]; then
        NEW_BEST_GAME=$GUESSES
      else
        NEW_BEST_GAME=$DB_BEST_GAME
      fi
    else
      NEW_GAMES_PLAYED=1
      NEW_BEST_GAME=$GUESSES
    fi

    # Update the user info in the database
    $($PSQL "UPDATE user_info SET games_played = $NEW_GAMES_PLAYED, best_game = $NEW_BEST_GAME WHERE username = '$USERNAME';")
    break
  elif [[ "$GUESS" -lt "$RANDOM_NUMBER" ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done