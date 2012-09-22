# Verwendet man ausschließlich systemd
# kann man init=/bin/systemd nach einem reboot
# wieder aus der bootloader konfig entnehmen
# und die pakete :

pacman -R initscripts sysvinit

# deinstallieren und

pacman -S systemd-sysvcompat

# installieren.

########################################
#
# Systemd Units liegen in /lib/systemd/system
#
# Um einen Dienst wie cronie (crond) beim start starten zu lassen 
# muss man diesen dienst mit systemctl enable <unit> aktivieren

systemctl enable cronie.service

# wenn man einen Dienst nur für die momentane sitzung
# starten möchte geht das mit

systemctl start <unit>

# anstelle von <unit> logischer weise den jeweiligen dienst einfügen

########################################
#
# für den anfang wichtige units sind wohl

network.target  bzw.  networkmanager.service (nur eins davon)
gdm.service
