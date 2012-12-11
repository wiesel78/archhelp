all: xorg multimedia internet treiber openclonk administration basissystem drucker vm dateisystem gnome netzwerk entwicklung bootloader 

xorg : 
	pacman -S xorg-server xorg-server-utils xorg-utils xorg-xinit  

multimedia : 
	pacman -S vlc clementine gimp evince eog libreoffice gstreamer0.10 gstreamer0.10-bad gstreamer0.10-bad-plugins gstreamer0.10-ffmpeg gstreamer0.10-good gstreamer0.10-good-plugins gstreamer0.10-ugly gstreamer0.10-ugly-plugins blender pitivi 

internet : 
	pacman -S ntp chromium transmission-gtk ddclient empathy telepathy-gabble flashplugin  

treiber : 
	pacman -S alsa-lib alsa-utils xf86-video-nouveau nouveau-dri xf86-input-synaptics  

openclonk : 
	pacman -S openclonk  

administration : 
	pacman -S sudo openssh zsh grml-zsh-config lshw gdisk rsync preload  

basissystem : 
	pacman -S base base-devel  

drucker : 
	pacman -S avahi cups hplip  

vm : 
	pacman -S qemu-kvm    

dateisystem : 
	pacman -S btrfs-progs ntfsprogs ntfs-3g dosfstools libdvdread libdvdcss libdvdnav  

gnome : 
	pacman -S gnome gdm gnome-tweak-tool gnome-contacts gnome-documents gnome-online-accounts gnome-power-manager gnome-user-share gnome-screenshot gcalctool file-roller  

netzwerk : 
	pacman -S wireless_tools networkmanager network-manager-applet networkmanager-openvpn networkmanager-pptp  nmap nbd samba smbclient gvfs-smb  

entwicklung : 
	pacman -S git geany gedit openmpi jre7-openjdk  

bootloader : 
	pacman -S grub-bios  
