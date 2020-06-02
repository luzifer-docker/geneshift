FROM i386/debian:stable

ENV DUMB_INIT_VERSION=1.2.2 \
    GENESHIFT_VERSION=1272 \
    GOSU_VERSION=1.11

COPY build.sh /usr/local/bin/
RUN set -ex \
 && bash /usr/local/bin/build.sh

VOLUME /config

EXPOSE 11235/udp

ADD run.sh /usr/local/bin/
ENTRYPOINT /usr/local/bin/run.sh
