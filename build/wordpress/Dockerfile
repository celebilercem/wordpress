ARG WORDPRESS_VERSION
FROM wordpress:$WORDPRESS_VERSION

# Use the default production configuration.
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN rm "$PHP_INI_DIR/php.ini-development"
