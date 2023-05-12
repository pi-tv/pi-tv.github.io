---
title: Arch Linux docs 
tags: [Arch Linux, Docs, Nginx]
ctags: [find, pacman]
desc: Arch Linux offline docs.
date: 2022-01-29
---

# Arch Linux docs

## Arch Linux offline docs

Arch has a lot of packages with offline documentation.

### Arch-wiki-docs

It is a mirror of the "wiki.archlinux.org" site.

ArchWiki is a great source of proven documentation related to Arch Linux system and Linux software.
It is also available offline as a package for Arch.

- Install: `pacman -Sy arch-wiki-docs`
- Remove all languages except the English to save disk space:
  `find /usr/share/doc/arch-wiki/html -mindepth 1 -maxdepth 1 -type d ! -name en | xargs rm -rf`
- Serve files on a local web server (see [Nginx config to serve docs](#nginx-config-to-serve-docs)).
- Access via "http://127.0.0.1/arch-wiki/en"

### Python-docs

It is a mirror of the "docs.python.org" site.

- Install `pacman -Sy python-docs`
- Serve files on a local web server (see [Nginx config to serve docs](#nginx-config-to-serve-docs)).
- Access via "http://127.0.0.1/python-docs"

### Nginx config to serve docs

```shell
    rewrite ^/arch-wiki/?$ /arch-wiki/en/ redirect;

    location /arch-wiki {
        alias /usr/share/doc/arch-wiki/html/;
        autoindex on;
        expires 1d;
    }

    location /arduino {
        alias /usr/share/doc/arduino/;
        autoindex on;
        expires 1d;
    }

    location /python-docs {
        alias /usr/share/doc/python/html/;
        autoindex on;
        expires 1d;
    }
```

## Links

- [Nginx](/nginx)