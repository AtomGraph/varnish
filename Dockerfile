FROM varnish:latest

LABEL maintainer="martynas@atomgraph.com"

RUN apt-get update -qq --allow-releaseinfo-change && \
    apt-get -yq install gettext && \
    rm -rf /var/lib/apt/lists/* && \
    chmod -R u+rw /etc/varnish/default.vcl

# chmod -R u+rw /var/lib/varnish

USER varnish

ENTRYPOINT ["/usr/local/bin/docker-varnish-entrypoint"]