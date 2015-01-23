# Perl

erstelle /etc/httpd/conf/extra/perl_module.conf

```
<IfModule dir_module>
	<IfModule perl_module>
		DirectoryIndex index.pl index.html
	</IfModule>
</IfModule>
```

binde perl in die Apache Konfiguration /etc/httpd/conf/httpd.conf ein.
In die LoadModule Liste

```
LoadModule perl_module modules/mod_perl.so
```

ind die Include Liste
```
Include conf/extra/perl_module.conf
```

und irgendwo ans Ende der Datei
```
Alias / /srv/http/
<Location />
    AddHandler perl-script .pl
    AddHandler perl-script .cgi
    PerlResponseHandler ModPerl::Registry
    PerlOptions +ParseHeaders
    Options +ExecCGI
    Order allow,deny
    Allow from all
</Location>
```

## Start

Natürlich noch den Apache Server Daemon neu starten um die
Änderungen zu übernehmen.

```
sudo systemctl restart httpd
```
