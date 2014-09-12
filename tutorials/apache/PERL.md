
# erstelle /etc/httpd/conf/extra/perl_module.conf

```
    <IfModule dir_module>
    	<IfModule perl_module>
    		DirectoryIndex index.pl index.html
    	</IfModule>
    </IfModule>
```

# binde perl in apache ein /etc/httpd/conf/httpd.conf

```
    LoadModule perl_module modules/mod_perl.so
    Include conf/extra/perl_module.conf


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

# wobei die Zeilen mit LoadModule und Include am Anfang 
# an das Ende des LoadModule bzw. des Include Blockes
# aus der httpd.conf zu setzen sind. Der Rest kann einfach
# an das Ende der Datei gehangen werden.

