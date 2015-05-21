#!/bin/bash

 BASEDIR=$(dirname $0)
 SO_DIR="${BASEDIR}/global/screen-object"
 CONSOLE_RED=$'\e[31m'
 CONSOLE_GREEN=$'\e[32m'
 CONSOLE_RESET='\e[0m' # No Color

 echo "Script location: ${SO_DIR}"

 if [ -d "${SO_DIR}" ]
 then
     echo "${CONSOLE_RED} Directory ${SO_DIR} exists."
     echo " Trying to pull the latest code from screen-object"
     echo " *********   Follow below steps if you see any issues with pull request  ****"
     echo " Step 1 : Delete screen-object folder (This folder is inside global folder)"
     echo " Step 2 : Run the pullso.sh script"
     tput sgr0

     cd global/screen-object
     git pull origin master

 else
     echo "${CONSOLE_GREEN}"
     echo "CLONING SCREEN OBJECT REPOSITORY"
     tput sgr0
     cd global
     git clone https://github.kdc.capitalone.com/mobius/screen-object
 fi