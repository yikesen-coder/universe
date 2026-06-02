#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
# INSERT Teams
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
 if [[ $WINNER != winner ]]
  then 
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      if [[ -z $TEAM_ID ]]
        then
          INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
            then
              echo Inserted into teams, $WINNER
          fi
      fi
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      if [[ -z $TEAM_ID ]]
        then
          INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
            then
              echo Inserted into teams, $OPPONENT
          fi
      fi
  fi
done
# INSERT GAMES
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
 if [[ $YEAR != year ]]
   then
     WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
     OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
     GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year = $YEAR AND ROUND = '$ROUND' AND winner_id = $WINNER_ID AND opponent_id= $OPPONENT_ID AND winner_goals=$WINNER_GOALS AND opponent_goals = $OPPONENT_GOALS")
     if [[ -z $GAME_ID ]]
       then 
         INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
          if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
            then
              echo Inserted into games, $ROUND, $WINNER vs $OPPONENT
          fi
      fi
  fi
done