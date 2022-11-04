FROM wordpress:6.1.0-php8.1-fpm-alpine

# Use the default production configuration.
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN rm "$PHP_INI_DIR/php.ini-development"
