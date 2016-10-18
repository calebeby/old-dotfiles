#!/bin/bash

source ~/dotfiles/bash_colors.sh

# Make script crontab friendly:
cd $(dirname $0)

#read lines, not words in string
#Internal Field Separator
IFS=$'\n'

clr_bold "Looking for git projects"
directories=$(find ~/Programming -type d -name .git)
for directory in $directories; do
  cd $directory
  cd ..
  name=$(pwd)
  dashes
  clr_bold -n "$name"
  unset t_std t_err
  eval "$( (git pull) 2> >(readarray -t t_err; typeset -p t_err) > >(readarray -t t_std; typeset -p t_std) )"
  if [[  $t_std != "" ]]; then
    if [[ $t_std == "Already up-to-date." ]]; then
      clr_green " ✔"
    else
      clr_green "\n$t_std"
    fi
  fi
  if [[  $t_err != "" ]]; then
    clr_red "\n$t_err"
  fi
  dashes
  echo -e ""

done
