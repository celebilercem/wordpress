# README #

## What is this repository for? ##

This repository contains a dockerized [WordPress](https://wordpress.com) package.

The package makes use exclusively of official [Docker](https://www.docker.com/) images.
It currently consists of:
   * Logging: [Elasticsearch](https://www.elastic.co/elastic-stack/) + [Fluentd](https://www.fluentd.org/) + [Kibana](https://www.elastic.co/kibana/) (EFK)
   * DBMS: [MariaDB](https://mariadb.org/)
   * [Redis](https://redis.io/)
   * WordPress with [PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
   * Web server: [NGINX](https://www.nginx.com/)
   * Reverse proxy: [Traefik](https://traefik.io/traefik/)

### Features

   * Parsing of logs for proper categorization in `Kibana`
   * PHP caching via [FastCGI](https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#fastcgi)
   * Object caching via `Redis`
   * Rate limiter against brute force attacks
   * Scored <b>A</b> by web security scanners (e.g., [ImmuniWeb](https://www.immuniweb.com/), [Security Headers](https://securityheaders.com/))
   * Automatic retrieval of HTTPS certificates with Traefik and [Cloudflare](https://www.cloudflare.com/)

### Docker image plugins

Some of the images have been extended with plugins (using methods recommended by the product owners):
   * Fluentd
       * [fluent-plugin-elasticsearch](https://github.com/uken/fluent-plugin-elasticsearch) - for sending logs to Elasticsearch
       * [fluent-plugin-rewrite-tag-filter](https://github.com/fluent/fluent-plugin-rewrite-tag-filter) - for routing logs to relevant parsers
   * NGINX
      * [ngx_cache_purge](https://github.com/FRiCKLE/ngx_cache_purge) - for purging `FastCGI` cache contents

## Get started

#### Pre-requisites

The below instructions are for the `root` user in a Docker-enabled Linux-based x86/x64 machine. They should be mostly applicable to other OSes/architectures as well.

### Configure environment variables

Create a new `.env` file with the necessary environment variables (see the `.env.example` file).
Restrict access to the file:
```
chmod 600 .env
```

### Customize configuration files

The `etc/` folder contains all the configuration files.
See how to set the JVM heap size in the official [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.16/advanced-configuration.html#set-jvm-heap-size).

### Run package

Run the following command from the root folder:
```
docker-compose up -d
```

### Install WordPress plugins

   * [NGINXHelper](https://wordpress.org/plugins/nginx-helper/) - adds support for the `ngx_cache_purge` module
   * [Redis Object Cache](https://wordpress.org/plugins/redis-cache/) - adds support for `Redis`
