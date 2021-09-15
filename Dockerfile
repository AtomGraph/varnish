FROM varnish:latest

LABEL maintainer="martynas@atomgraph.com"

RUN apt-get update -qq --allow-releaseinfo-change && \
  apt-get -yq install gettext && \
  rm -rf /var/lib/apt/lists/*

# USER varnish

ENTRYPOINT ["/usr/local/bin/docker-varnish-entrypoint"]