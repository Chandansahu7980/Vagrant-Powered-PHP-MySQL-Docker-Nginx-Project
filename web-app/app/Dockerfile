FROM php:8.2-cli

# Install dependencies
RUN docker-php-ext-install mysqli

# Set working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start PHP built-in server
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]