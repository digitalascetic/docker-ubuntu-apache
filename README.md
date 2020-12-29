# docker-ubuntu-apache


*Based on ubuntu-{version} images*

ubuntu 20.04 (default) version with apache server with mpm-event and proxy modules container configurable through environment variables:

```
ENV PHP_FPM_HOST="php"
ENV PHP_FPM_PORT="9000"
```

### Loaded Modules

* core_module (static)
* so_module (static)
* watchdog_module (static)
* http_module (static)
* log_config_module (static)
* logio_module (static)
* version_module (static)
* unixd_module (static)
* access_compat_module (shared)
* alias_module (shared)
* auth_basic_module (shared)
* authn_core_module (shared)
* authn_file_module (shared)
* authz_core_module (shared)
* authz_host_module (shared)
* authz_user_module (shared)
* autoindex_module (shared)
* deflate_module (shared)
* dir_module (shared)
* env_module (shared)
* fcgid_module (shared)
* filter_module (shared)
* mime_module (shared)
* mpm_event_module (shared)
* negotiation_module (shared)
* proxy_module (shared)
* proxy_fcgi_module (shared)
* reqtimeout_module (shared)
* rewrite_module (shared)
* setenvif_module (shared)
* status_module (shared)

### Build
```
# You can change the DEFAULT_UBUNTU_VERSION argument
docker build --build-arg DEFAULT_UBUNTU_VERSION=20.04 -t ascetic/ubuntu-apache-mpm-event .
```

### RUN
```
docker run -i -d --name apache -p 8080:80 --network {SAME_NETWORK_AS_PHP_NODE}  -t ascetic/ubuntu-apache-mpm-event
```