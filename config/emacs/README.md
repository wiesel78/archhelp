# Emacs

If you're using systemd as init system you can use the `emacs@service` file to load emacs
within your system boot. This file goes to `/usr/lib/systemd/system`. After that 
you can [enable|start] it with `systemctl [enable|start] emacs@<username>`.
