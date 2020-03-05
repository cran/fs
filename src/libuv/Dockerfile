FROM alpine:3.8

RUN \
	apk add --no-cache \
		autoconf \
		build-base \
		R \
		R-dev && \
	apk add --no-cache --virtual .build-deps \
		wget && \
	apk del .build-deps

RUN \
	mkdir -p /usr/share/doc/R/html && \
	R -e 'install.packages("remotes", repos="http://cran.rstudio.com")'
