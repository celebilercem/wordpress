# https://docs.fluentd.org/container-deployment/docker-compose
FROM fluentd:latest

# Use root account to install plugins.
USER root
RUN gem install fluent-plugin-elasticsearch --no-document --version 5.4.0
RUN gem install fluent-plugin-rewrite-tag-filter --no-document --version 2.4.0

USER fluent
