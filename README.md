# varnish

Docker image for Varnish 4 HTTP proxy cache: https://varnish-cache.org

Supported environment variables:
* `VARNISH_LISTEN_PORT`
* `VARNISH_VCL_CONF`
* `VARNISH_ADMIN_LISTEN_ADDRESS`
* `VARNISH_ADMIN_LISTEN_PORT`
* `VARNISH_TTL`
* `VARNISH_MIN_THREADS`
* `VARNISH_MAX_THREADS`
* `VARNISH_THREAD_TIMEOUT`
* `VARNISH_SECRET_FILE`
* `VARNISH_STORAGE_FILE`
* `VARNISH_STORAGE_SIZE`
* `VARNISH_STORAGE`

Needs to be run with `--privileged` option for some reason.
