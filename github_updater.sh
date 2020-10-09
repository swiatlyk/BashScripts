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
    echo "Reading branch name from config file"
    cd .git
    BRANCH=$(cat config | grep branch | cut -c 9- | rev | cut -c 2- | rev | cut -c 2- | rev | cut -c 2- | rev)
    echo -e "Found branch: \e[31m"$BRANCH"\e[0m"
    cd ..;

    # finally pull
    echo -e "Pulling changes from branch \e[31m"$BRANCH"\e[0m"
    git pull origin $BRANCH;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo -e "\n\e[32mComplete!\e[0m"
