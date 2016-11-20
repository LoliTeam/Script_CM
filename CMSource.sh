#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # White
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear

        echo -e "${bldred}                                 "
        echo -e "${bldred}   ----------------------------- "
        echo -e "${bldred}   |    ${bldnormal}Auto-installation CM     ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   | ${bldnormal}Downloading source code ${bldred}| "
        echo -e "${bldred}   |                           | "
        echo -e "${bldred}   |   ${bldnormal}Setting up your computer  ${bldred}| "
        echo -e "${bldred}   ----------------------------  "

tput setaf 2
	mkdir -p ~/android/system
	cd ~/android/system
	
  # Initial git config
	echo "Enter your email address of Github: "
	read input_email
	echo "Enter a user of your commits on Github: "
	read input_user
	git config --global user.email "$input_email"
	git config --global user.name "$input_user"
	
clear

  # CM version selection
  echo "============================================================"
  echo " Elige tu versión de CM"
  echo "============================================================"
  echo 
  echo "  1 - CyanogenMod 12.0"
  echo "  2 - CyanogenMod 12.1"
  echo "  3 - CyanogenMod 13.0"
  echo "  4 - CyanogenMod 14.0"
  echo "  5 - CyanogenMod 14.1"
  echo
  echo -n "Enter an option: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) repo init -u git://github.com/CyanogenMod/android.git -b cm-12.0;;
      2) repo init -u git://github.com/CyanogenMod/android.git -b cm-12.1;;
      3) repo init -u git://github.com/CyanogenMod/android.git -b cm-13.0;;
      4) repo init -u git://github.com/CyanogenMod/android.git -b cm-14.0;;
      5) repo init -u git://github.com/CyanogenMod/android.git -b cm-14.1;;
    esac
  fi

  # First sync
	time repo sync --force-broken --force-sync -j4
	echo  
	echo -e "${bldcya}The CM source was downloaded in ~/android/system"
	echo -e "${bldcya}You can compile CM in the location ~/android/system"
	echo -e "${bldcya}Remember to do ${bldgrn}ccache -M 40 ${bldcya}to put 40gb cache, before starting your first build :)" 
	mkdir ~/android/system/.repo/local_manifests
	echo "<?xml version="1.0" encoding="UTF-8"?>" >> ~/android/system/.repo/local_manifests/roomservice.xml
	echo "<manifest>" >> ~/android/system/.repo/local_manifests/roomservice.xml
	echo "</manifest>" >> ~/android/system/.repo/local_manifests/roomservice.xml
        echo -e "${bldred}   -------------------------------------------------- "
        echo -e "${bldred}   |   Do not forget to download the source code    | "
        echo -e "${bldred}   |                                                | "
        echo -e "${bldred}   |       for your device before compiling.        | "
        echo -e "${bldred}   |                                                | "
        echo -e "${bldred}   -------------------------------------------------- "
exit
