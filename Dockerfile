FROM alpine:3.7
MAINTAINER tinko <dingguotu@gmail.com>

RUN cd /lib && ln -s ld-linux-armhf.so.3 ld-linux.so.3

RUN apk add --no-cache --purge -uU bash

WORKDIR /xware
ADD Xware1.0.31_x86_32_uclibc.zip /xware
ADD monitor.sh /xware

VOLUME /data

CMD ["./monitor.sh"]
