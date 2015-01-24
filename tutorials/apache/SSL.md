# SSL mit Apache

## Zertifikat erstellen

Wechsle in das Verzeichnis /etc/httpd/conf/ und führe folgende Befehle aus

```
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out server.key
chmod 600 server.key
openssl req -new -sha256 -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
```

Danach die folgenden Zeilen in der /etc/httpd/conf/httpd.conf auskommentieren

```
LoadModule ssl_module_modules/mod_ssl.so
LoadModule socache_shmcb_module modules/mod_socache_chmcb.so
Include conf/extra/httpd-ssl.conf
```

Apache Daemon neu starten

```
systemctl restart httpd
```
