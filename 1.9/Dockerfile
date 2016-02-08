FROM debian:jessie

MAINTAINER Kevin Bungeneers <kevin.bungeneers@gmail.com>

ENV NGINX_VERSION   1.9.10-1~jessie
ENV INDEX_FILE      index.php
ENV DOCUMENT_ROOT   /var/www/
ENV FASTCGI_PASS    127.0.0.1:9000
ENV APP_ENV         dev

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base \
	&& rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
