#!/bin/sh
chmod +x /cron_configuration/*.*

echo /== Added Cron Jobs==/
cp --force /cron_configuration/cron_configuration /var/spool/cron/crontabs/root
cat /var/spool/cron/crontabs/root
echo 
echo /== First estcmd gather ==/
echo ${INITIAL_COMMAND} | /bin/sh -
echo /== Cron Start ==/
crond -l 2 -f