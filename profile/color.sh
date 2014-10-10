#!/bin/bash

function success {
   if [ $? = 0 ] ; then
      echo -e "${green}✔${color_off}"
   else
      echo -e "${red}✘${color_off}"
   fi
}

function color {
   echo -e "$1$2${color_off}"
}

function color_on {
   echo ""
   #echo -e "\033[$1;$2m"
}

#export black="\[$(tput setaf 0)\]"
#export red="\[$(tput setaf 1)\]"
#export green="\[$(tput setaf 2)\]"
#export lime_yellow="\[$(tput setaf 190)\]"
#export yellow="\[$(tput setaf 3)\]"
#export powder_blue="\[$(tput setaf 153)\]"
#export blue="\[$(tput setaf 4)\]"
#export magenta="\[$(tput setaf 5)\]"
#export cyan="\[$(tput setaf 6)\]"
#export white="\[$(tput setaf 7)\]"
#export bright="\[$(tput bold)\]"
#export color_off="\[$(tput sgr0)\]"
#export blink="\[$(tput blink)\]"
#export reverse="\[$(tput smso)\]"
#export underline="\[$(tput smul)\]"

export color_off="" #"$(echo -e "\[\033[0m")\]"
export black="$(color_on 0 30)"
export darkgrey="$(color_on 1 30)"
export blue="$(color_on 0 34)"
export lightblue="$(color_on 1 34)"
export green="$(color_on 0 32)"
export lightgreen="$(color_on 1 32)"
export cyan=$(color_on 0 36)
export lightcyan=$(color_on 1 36)
export red=$(color_on 0 31)
export lightred=$(color_on 1 31)
export purple=$(color_on 0 35)
export lightpurple=$(color_on 1 35)
export brown=$(color_on 0 33)
export yellow=$(color_on 1 33)
export lightgrey=$(color_on 0 37)
export white=$(color_on 1 37)
