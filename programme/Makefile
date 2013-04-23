all: xorg multimedia internet treiber administration drucker vm dateisystem netzwerk gnome entwicklung 

xorg : 
	pacman -S xorg-server xorg-server-utils xorg-utils xorg-xinit 

multimedia : 
	pacman -S vlc clementine gimp p7zip libreoffice gstreamer0.10 gstreamer0.10-bad gstreamer0.10-bad-plugins gstreamer0.10-ffmpeg gstreamer0.10-good gstreamer0.10-good-plugins gstreamer0.10-ugly gstreamer0.10-ugly-plugins blender pitivi 

internet : 
	pacman -S ntp chromium ddclient telepathy-gabble flashplugin freetalk 

treiber : 
	pacman -S alsa-lib alsa-utils xf86-video-ati ati-dri xf86-input-synaptics 

administration : 
	pacman -S sudo openssh zsh grml-zsh-config rxvt-unicode lshw gdisk rsync preload arch-install-scripts numlockx 

drucker : 
	pacman -S avahi cups hplip 

vm : 
	pacman -S qemu   

dateisystem : 
	pacman -S btrfs-progs ntfsprogs ntfs-3g dosfstools libdvdread libdvdcss libdvdnav 

netzwerk : 
	pacman -S networkmanager network-manager-applet networkmanager-openvpn networkmanager-pptp nfs-utils  nmap nbd samba smbclient gvfs-smb 

gnome : 
	pacman -S gnome transmission-gtk file-roller 

entwicklung : 
	pacman -S geany gedit openmpi eclipse 
