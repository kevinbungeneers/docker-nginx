#!/bin/bash -e

sed -i "s|DOCUMENT_ROOT|$DOCUMENT_ROOT|g" /etc/nginx/conf.d/default.conf \
&& sed -i "s|INDEX_FILE|$INDEX_FILE|g" /etc/nginx/conf.d/default.conf \
&& sed -i "s|FASTCGI_PASS|$FASTCGI_PASS|g" /etc/nginx/conf.d/default.conf \
&& sed -i "s|APP_ENV|$APP_ENV|g" /etc/nginx/conf.d/default.conf

exec "$@"
