# Server Configuration

## Basic Stack Setup

We need the following for a basic setup
`pacman -S lighttpd php php-cgi mariadb mariadb-clients`

Copy paste configuration and adjust it to your needs.
Replace the authentication part within lighttpd.conf (e.g. `user => "xxx"`).
Set the root pass for maria with `mysqladmin -uroot password 'password'` refers to the my.cnf (`password = xxx`).

If there are question contact [Llmp-Stack](https://wiki.archlinux.de/title/Lighttpd).
