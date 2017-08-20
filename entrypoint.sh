#!/bin/bash

mount -t tmpfs -o size=1G tmpfs /var/lib/varnish

varnishd     -F -a ${VARNISH_LISTEN_ADDRESS}:${VARNISH_LISTEN_PORT} \
             -f ${VARNISH_VCL_CONF} \
             -T ${VARNISH_ADMIN_LISTEN_ADDRESS}:${VARNISH_ADMIN_LISTEN_PORT} \
             -t ${VARNISH_TTL} \
             -p thread_pool_min=${VARNISH_MIN_THREADS} \
             -p thread_pool_max=${VARNISH_MAX_THREADS} \
             -p thread_pool_timeout=${VARNISH_THREAD_TIMEOUT} \
             -S ${VARNISH_SECRET_FILE} \
             -s ${VARNISH_STORAGE}