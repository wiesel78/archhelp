 #!/bin/bash
 # This script switches the video driver from Nvidia devices.
 # Possible are the open source Nouveau or the original Nvidia
 # driver. This script doesn't solve problems with the xorg
 # configuration. A solution might be deleting or generating 
 # a new xorg.conf .
 #
 # Adjust this script to your needs.
 #
 # Author: Juerges, Henrik (juerges.henrik@gmail.com)
 # emacs: tabswidth=4
 set -e
 
 # nouveau to nvidia
 nvidia(){
     sed -i 's/MODULES="nouveau"/#MODULES="nouveau"/' /etc/mkinitcpio.conf
     
     pacman -Rdds --noconfirm nouveau-dri xf86-video-nouveau mesa-libgl lib32-nouveau-dri lib32-mesa-libgl
     
     # check arch
     if [[ $CPUTYPE == 'x86_64' ]]; then
         pacman -Rdds --noconfirm lib32-nouveau-dr lib32-mesa-libgl
         pacman -S --noconfirm lib32-nvidia-libgl
     fi
     
     pacman -S --noconfirm nvidia lib32-nvidia-libgl nvidia-libgl nvidia-utils
 
     mkinitcpio -p linux
     mkinitcpio -p linux-ck
 }

 # nvidia to nouveau
 nouveau() {
     sed -i 's/#*MODULES="nouveau"/MODULES="nouveau"/' /etc/mkinitcpio.conf
 
     pacman -Rdds --noconfirm nvidia nvidia-libgl nvidia-utils
 
     # check arch
     if [[ $CPUTYPE == 'x86_64' ]]; then
         pacman -Rdds --noconfirm lib32-nvidia-libgl
         pacman -S --noconfirm lib32-nouveau-dri lib32-mesa-libgl
     fi
     
     pacman -S --noconfirm nouveau-dri xf86-video-nouveau lib32-nouveau-dri mesa-libgl lib32-mesa-libgl   
     
     
     mkinitcpio -p linux
     mkinitcpio -p linux-ck
 }

 # help message
 help() {
     echo -e "USAGE: \t -h\t:print this info"
     echo -e "\t -no\t:nvidia to nouveau"
     echo -e "\t -ni\t:nouveau to nvidia"
 }
 
  # check if root
 if [[ $EUID -ne 0 ]]; then
    echo "You must be root to run this script. Aborting...";
    exit 1;
 fi
 
 if [[ $1 == '-h' ]]; then
     help
     exit 0;
 fi

 # check direction
 if [[ $1 == '-ni' ]]; then
     nvidia
     exit 0;
 fi

 if [[ $1 == '-no' ]]; then
     nouveau
     exit 0;
 else
     help
     exit 1;
 fi
 
 ## END OF FILE
