# Build stage
FROM php:8.3-cli as build

WORKDIR /app

# Copy application files
COPY . .

# Runtime stage
FROM php:8.3-apache

WORKDIR /var/www/html

# Copy application files from build stage
COPY --from=build /app /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
