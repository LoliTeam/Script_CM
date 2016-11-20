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

tput setaf 3
	sleep 1
	echo  
	echo Updating package list ...
	echo  
	sleep 3
tput setaf 2
	time sudo apt-get update
tput setaf 3
	echo  
	echo Installing required packages ...
	echo  
	sleep 3
tput setaf 2
	time sudo apt-get -y install git-core python gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk3.0-dev \
squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush \
schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev g++-multilib lib32z1-dev lib32ncurses5-dev \
lib32readline6-dev gcc-multilib liblz4-* pngquant ncurses-dev texinfo gcc patch cmake libtool \
automake g++ gawk subversion expat libexpat1-dev python-all-dev libgcc1:i386 bc libcloog-isl-dev \
libcap-dev autoconf libgmp-dev pkg-config libmpc-dev libmpfr-dev lzma* \
liblzma* w3m phablet-tools android-tools-adb screen maven tmux
tput setaf 3
	echo  
	echo Installing and configuring ccache
	echo 
tput setaf 2 	
	git clone https://github.com/ccache/ccache.git -b master
	cd ccache
	./autogen.sh
	./configure
	make
	sudo cp -v ./ccache /usr/bin/ccache
	echo "export USE_CCACHE=1" >> ${HOME}/.bashrc
	echo  
tput setaf 3
	echo Downloading repo, if installed will be updated ...
tput setaf 2
	cd ..
	echo  
	sleep 2
	mkdir -p ~/bin
	PATH=~/bin:$PATH
	curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	chmod a+x ~/bin/repo
clear
tput setaf 3
	echo  
	echo -e "${bldcya}To continue the installation, run ${bldred}CMSource.sh "
	echo  
	sleep 5
tput setaf 2
