FROM alpine:3.7
MAINTAINER tinko <dingguotu@gmail.com>

RUN cd /lib && ln -s ld-linux-armhf.so.3 ld-linux.so.3

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache bash bash-doc bash-completion \
    && rm -rf /var/cache/apk/* \
    && /bin/bash

WORKDIR /xware
ADD Xware1.0.31_x86_32_uclibc.zip /xware
ADD monitor.sh /xware

VOLUME /data

CMD ["./monitor.sh"]
