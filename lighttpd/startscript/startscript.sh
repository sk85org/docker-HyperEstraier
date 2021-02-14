#!/bin/sh
mkdir -p /www/public
cp /usr/local/libexec/estseek.cgi /www/public
chmod 755 /www/public/estseek.cgi 
ln -s /configuration/estseek.* /www/public
lighttpd -D -f /configuration/lighttpd.conf