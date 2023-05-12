---
title: Nginx
tags: [Nginx, Network]
date: 2022-01-12
---

# Nginx

## Base config "/etc/nginx/nginx.conf"

```shell
worker_processes 1;

events {
    worker_connections 64;
}

http {
    charset utf-8;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    server_tokens off;
    types_hash_max_size 4096;
    client_max_body_size 2M;

    include mime.types;
    default_type application/octet-stream;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log warn;

    include /etc/nginx/conf.d/*.conf;
}
```