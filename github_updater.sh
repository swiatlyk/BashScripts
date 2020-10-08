#!/bin/bash
#Run this script in your git repository folder
# store the current dir
CUR_DIR=$(pwd)

echo -e "\n\e[32mPulling in latest changes for all repositories...\e[0m"

# Find all git repositories 
echo -e "\e[33mLooking for git repositories to update in "$CUR_DIR"\e[0m"
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo -e "\e[34m"$i"\e[0m";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally pull
    git pull origin master;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo -e "\n\e[32mComplete!\e[0m"
