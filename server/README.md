# Server Configuration

## Preface

This section of the archhelp-repo describes an example server setup.
It includes at first webserver, mysql, php, mpd (for streaming), and mailserver.
Later I will it expand this section with more advanced setups.

The explanation may be short but on purpose. I don't want to describe every part and technique
it will be too much and I think you only need a short reference and not a whole tutorial.
So I refer to blogs and wikis where you can read for further information.
And read the config files, the most important parts have comments.

Feel free to contribute, give feedback or bug reports. The latter can be raised via the Issue section.

## Basic Stack Setup

For the basic setup you'll need a standard arch linux running on your system.

We need the following for a basic setup:
`pacman -S lighttpd php php-cgi mariadb mariadb-clients`

Copy the php/mysql/lighttpd configuration to /etc/php/mysql/lighttpd and adjust it to your needs.
Replace the authentication part within lighttpd.conf (e.g. `user => "xxx"`).

Powering up everything with `systemctl [enable|start] lighttpd mysql`.

Set the root pass for maria with `mysqladmin -uroot password 'password'` refers to the my.cnf (`password = xxx`).

If there are questions read [Lighty](https://wiki.archlinux.org/index.php/lighttpd)
or if you understand german [Llmp-Stack](https://wiki.archlinux.de/title/Lighttpd) for a full introduction.

## MPD Streaming Setup

`pacman -S mpd`

For webstreaming with mpd we use 3 instaces, located under `/srv/mpd/glblsteam[012]`.
Copy mpd/mpd.conf to your streaming directories and adjust the paths.

For every stream increment the tcp-port variable `port "6600"` and the http port variable `port "7701"` in mpd.conf

`chown -R mpd:mpd /var/lib/mpd`

`ln -s /path/to/music /srv/mpd/music`

The lighttpd.con has a streaming part for mpd with password protection. So you can safely reverse-proxy it through your webserver to the internet.

Before we can power up the mpd we need the systemd service.
Copy the `mpd/mpd0.service` file to `/etc/systemd/system/multi-user.target.wants/` and adjust the `ExecStart` path.
Do this for every streaming instance.

At least we can power up mpd with `systemctl [enable|start] mpd0`

If there are questions read [MPD](https://wiki.archlinux.org/index.php/Music_Player_Daemon).

## Munin

Munin is a monitoring tool for single server and multiple server infrastructures.

`pacman -S munin munin-node` and on every node `pacman -S munin-node`

Copy and adjust the config to your needs. Run on every node `muni-node-configure --suggest`
to see suggested plugins.

To install the suggested plugins use `munin-node-configure --shell | sh`

Create the html dir (you set in munin.conf) under your webserver root and change the owner to munin:http and add
munin to the http group.

Run `crontab /etc/munin/munin-cront-entry -u munin` and `usermod -aG log munin` because munin plugins read log files.

Start munin with `systemctl start munin-node` on every node and `systemctl enable munin-node`.

## Setting up a mailserver with postfix, postfixadmin, dovecot and roundcubemail

I don't want to write a full How-To, this is just a "speed-run" to make my configuration work.
For a detailed explanation or custom setup I refer to the well written repo [MailServer](https://github.com/geekinthesticks/ArchLinux-Mail-Server/blob/master/archlinux_mail_server.org).
