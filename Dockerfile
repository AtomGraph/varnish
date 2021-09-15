FROM varnish:latest

LABEL maintainer="martynas@atomgraph.com"

RUN apt-get update -qq --allow-releaseinfo-change && \
  apt-get upgrade -yqq && \
  apt-get -yqq install varnish && \
  apt-get -yqq clean && \
  apt-get -yq install gettext && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh entrypoint.sh

# USER varnish

ENTRYPOINT ["/usr/local/bin/docker-varnish-entrypoint"]