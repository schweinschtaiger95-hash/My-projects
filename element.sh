#!/bin/bash

# Changed --tuples-only to --no-align --tuples-only to strip annoying whitespace
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, symbol, elements.name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE elements.atomic_number=$1")
  else
    # FIXED: Changed LIKE to exact matches for symbol OR name
    ELEMENT=$($PSQL "SELECT atomic_number, symbol, elements.name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE elements.symbol='$1' OR elements.name='$1'")
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # FIXED: Handled clean pipe-delimited reading from --no-align
    echo "$ELEMENT" | while IFS="|" read ATOMIC_NUM SYMBOL NAME ATOMIC_MASS MPC BPC TYPE
    do
      # FIXED: Replaced curly apostrophe ’ with a normal straight apostrophe '
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    done
  fi
else
  echo "Please provide an element as an argument."
fi
