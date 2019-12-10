#!/bin/sh

declare -a THEME_NAMES
THEME_NAMES=(azure gr33n izzet)

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

~/change-theme/change-zshrc "$1"

~/change-theme/change-vscode "$1"

~/change-theme/change-vim "$1"

~/change-theme/change-nvim "$1"

# To use the change-iterm2 script:
#  change to desired theme 
#  check diff in ~/iTerm2/in com.googlecode.iterm2.plist to retrieve code
#  assign code to argToEditorTheme object

#~/change-theme/change-iterm2 "$1"
