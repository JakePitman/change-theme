#!/bin/bash

declare -a THEME_NAMES
THEME_NAMES=(azure gr33n)

print_usage(){
  echo "USAGE:"
  echo "  change-theme <THEME_NAME>"
  echo "    Acceptable theme names:"
  for name in "${THEME_NAMES[@]}"
  do
    echo "      $name"
  done
}

check_arg(){
  result=1
  for name in "${THEME_NAMES[@]}"
  do
    if [[ "$name" = "$1" ]]
    then
      result=0
    fi
  done
  if [ ! $result = 0 ]
  then
    print_usage
    exit 1
  fi
}

check_arg "$1"

./change-zshrc "$1"
