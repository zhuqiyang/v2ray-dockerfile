#!/bin/bash

sed -i -e "27i\"address\": \"${IP}\",\n\"port\": ${PORT}," -e '27,28d' /usr/local/etc/v2ray/config.json

/usr/bin/supervisord -c /etc/supervisord.conf &

/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json &

/usr/sbin/privoxy --no-daemon /etc/privoxy/config
