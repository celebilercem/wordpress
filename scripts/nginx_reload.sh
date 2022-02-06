#!/bin/bash

DOCKER="/usr/bin/docker"

$DOCKER exec nginx nginx -s reload
