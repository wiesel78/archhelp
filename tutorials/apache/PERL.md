
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
```

