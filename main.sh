#!/bin/sh

declare -a THEME_NAMES
THEME_NAMES=(azur3 gr33n izz3t backfir3 d3ng3ki)

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

SCRIPT_DIR=$(dirname $0)

"$SCRIPT_DIR"/change-zshrc "$1"

"$SCRIPT_DIR"/change-vscode "$1"

"$SCRIPT_DIR"/change-vim "$1"

"$SCRIPT_DIR"/change-nvim "$1"

"$SCRIPT_DIR"/change-tmux "$1"
tmux source-file ~/.tmux.conf

# To use the change-iterm2 script:
#  change to desired theme 
#  check diff in ~/iTerm2/in com.googlecode.iterm2.plist to retrieve code
#  assign code to argToEditorTheme object

#~/change-theme/change-iterm2 "$1"
