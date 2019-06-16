#!/bin/bash

mount -o size="$VARNISH_STORAGE_SIZE" \
  -t tmpfs \
  tmpfs /var/lib/varnish

varnishd -f "$VARNISH_VCL_CONF" \
  -F -a "$VARNISH_LISTEN_ADDRESS":"$VARNISH_LISTEN_PORT" \
  -p thread_pool_min="$VARNISH_MIN_THREADS" \
  -p thread_pool_max="$VARNISH_MAX_THREADS" \
  -p thread_pool_timeout="$VARNISH_THREAD_TIMEOUT" \
  -s "$VARNISH_STORAGE" \
  -S "$VARNISH_SECRET_FILE" \
  -t "$VARNISH_TTL" \
  -T "$VARNISH_ADMIN_LISTEN_ADDRESS":"$VARNISH_ADMIN_LISTEN_PORT"