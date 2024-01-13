#!/bin/bash

RESET="\033[0m"
YELLOW="\033[33m"
CYAN="\033[36m"
GREEN="\033[32m"
RED="\033[31m"

declare -a branches

while read -r line; do
	branches+=("$line")
done < <(git branch --format="%(refname:short)")

for branch in "${branches[@]}"; do
	if [[ "$branch" != "main" ]]; then
		read -p "$(echo -e $YELLOW)Delete branch "$branch"?$(echo -e $RESET) $(echo -e $CYAN)[Y/n]:$(echo -e $RESET) " answer
		if [[ "$answer" == "Y" ]]; then
			OUTPUT=$(git branch -d "$branch")
			if [[ "$?" -eq 0 ]]; then
				echo "$(echo -e $GREEN)$OUTPUT$(echo -e $RESET)"
			else
				echo "$(echo -e $RED)$OUTPUT$(echo -e $RESET)"
				read -p "$(echo -e $YELLOW)Force delete branch $branch?$(echo -e $RESET) $(echo -e $CYAN)[Y/n]:$(echo -e $RESET) " answer
				if [[ "$answer" == "Y" ]]; then
					OUTPUT=$(git branch -D "$branch")
					echo "$(echo -e $GREEN)$OUTPUT$(echo -e $RESET)"
				fi
			fi
		fi
	fi
done
