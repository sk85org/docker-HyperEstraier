#!/bin/sh
mkdir -p /www/public
cp /usr/local/libexec/estseek.cgi /www/public
chmod 755 /www/public/estseek.cgi 

for f in /configuration/estseek.*.template
do 
    #echo $f
    outputfile=${f%.template}
    outputfile_basename=${outputfile##*/}
    #echo $outputfile_basename
    envsubst < $f > /www/public/$outputfile_basename
done

lighttpd -D -f /configuration/lighttpd.conf