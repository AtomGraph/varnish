FROM ubuntu:latest

LABEL maintainer="martynas@atomgraph.com"

RUN apt-get update -qq && \
  apt-get upgrade -yqq && \
  apt-get -yqq install varnish && \
  apt-get -yqq clean

ENV VARNISH_LISTEN_PORT            80
ENV VARNISH_VCL_CONF               /etc/varnish/default.vcl
ENV VARNISH_ADMIN_LISTEN_ADDRESS   127.0.0.1
ENV VARNISH_ADMIN_LISTEN_PORT      6082
ENV VARNISH_TTL                    120
ENV VARNISH_MIN_THREADS            50
ENV VARNISH_MAX_THREADS            1000
ENV VARNISH_THREAD_TIMEOUT         120
ENV VARNISH_SECRET_FILE            /etc/varnish/secret
ENV VARNISH_STORAGE_FILE           /var/lib/varnish/varnish_storage.bin
ENV VARNISH_STORAGE_SIZE           1G
ENV VARNISH_STORAGE                "file,${VARNISH_STORAGE_FILE},${VARNISH_STORAGE_SIZE}"

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]

EXPOSE $VARNISH_LISTEN_PORT