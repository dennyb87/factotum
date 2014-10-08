#!/usr/bin/env bash
#
#Factotum - Tune up your Ubuntu distro after installation.
#
#Copyright (C) 2014 Denny Baldini <dennybaldini@gmail.com>
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

#Don't change these
SWAP_STR="vm.swappiness="
CACHE_STR="vm.vfs_cache_pressure="
SYSCTL_PATH="/etc/sysctl.conf"

#Settings
SWAP=%d       
CACHE=%d        
STARTAPP=%d 
JAVA="%s"
JAVA_PPA="%s" 
RESTRICTED_EXTRAS="%s" 
PACKAGES="%s"
        
            
#User choice Yes/No
user_choice () {    
    while true; do
        read -p "$1" yn </dev/tty
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}
    
#Manages /etc/sysctl.conf
optimize_sysctl () {
    if grep --quiet $1 $SYSCTL_PATH; then
        echo
        sudo sed --in-place "/^$1/ d" $SYSCTL_PATH
    fi
        echo "Set "$1$2""
        cp $SYSCTL_PATH /tmp/
        echo $1$2 >> /tmp/sysctl.conf
        sudo cp /tmp/sysctl.conf /etc/
}
    
echo
echo "Factotum says hello!"
user_choice "Do you want to start the process(Y/N)?"
      
echo
optimize_sysctl $SWAP_STR $SWAP
optimize_sysctl $CACHE_STR $CACHE
   
echo
echo "Show startup applications"
 
#Show startup applications
cd /etc/xdg/autostart/
        
if [ $STARTAPP = 1 ]; then            
    sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
else
    sudo sed --in-place 's/NoDisplay=false/NoDisplay=true/g' *.desktop
fi
    cd
      
#If the version of java requires the addition of a repository
if [ -n "$JAVA_PPA" ]; then
    sudo add-apt-repository $PPA </dev/tty
    sudo apt-get update </dev/tty
fi

#Install JAVA
if [ -n "$JAVA" ]; then
    sudo apt-get install $JAVA </dev/tty
fi
  
#Install RESTRICTED_EXTRAS
if [ -n "$RESTRICTED_EXTRAS" ]; then
    sudo apt-get install $RESTRICTED_EXTRAS </dev/tty
fi
   
#If restricted-extras has been installed will run install-css.sh 
if dpkg-query -W $RESTRICTED; then
    sudo /usr/share/doc/libdvdread4/install-css.sh </dev/tty
fi

#Install the packages
for package in $PACKAGES; do
    sudo apt-get install $package </dev/tty
done

echo
echo "Factotum has finished executing operations..."
echo "Press ENTER to quit"
read USER_INPUT </dev/tty
