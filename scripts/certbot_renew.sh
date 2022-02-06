#!/bin/bash

COMPOSE="/usr/bin/docker-compose --no-ansi"
DOCKER="/usr/bin/docker"

cd /var/docker/khosann.com
#$COMPOSE run certbot renew --dry-run && $DOCKER exec nginx nginx -s reload
$COMPOSE run certbot renew && $DOCKER exec nginx nginx -s reload
$DOCKER system prune -af
