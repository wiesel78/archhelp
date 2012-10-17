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

avahi-daemon.service    # notwendig für cups
cups.service            # Drucker
ntpd.service            # Zeit-Synchronisierung
gdm.service             # Login-Manager
NetworkManager.service  # Networkmanager
