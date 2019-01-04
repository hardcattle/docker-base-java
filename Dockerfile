FROM alpine:3.7

MAINTAINER hardcattle@gmail.com

WORKDIR /tmp

RUN apk upgrade && apk update \
    && wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jre-8u191-linux-x64.tar.gz \
    && tar xzf jre-8u191-linux-x64.tar.gz -C /usr/local/ \
    && apk --no-cache add ca-certificates \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk \
    && apk add glibc-2.28-r0.apk \
    && rm -rf *

ENV JAVA_HOME=/usr/local/jre1.8.0_191
ENV CLASSPATH=$JAVA_HOME/bin
ENV PATH=.:$JAVA_HOME/bin:$PATH

CMD ["/bin/sh"]