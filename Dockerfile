FROM php:8.3-cli

# Install dependensi sistem yang dibutuhkan Laravel dan ekstensi PHP
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    sqlite3 \
    libsqlite3-dev \
    && docker-php-ext-install pdo_mysql pdo_sqlite zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Set working directory
WORKDIR /var/www

# STRATEGI CACHING: Copy file composer DULU sebelum copy seluruh kode
COPY composer.json composer.lock ./

# Install dependensi Laravel (mengabaikan skrip untuk mencegah error saat build awal)
RUN composer install --no-scripts --no-interaction --prefer-dist
# Setelah dependensi terinstall, baru copy seluruh kode aplikasi
COPY . .
# Generate key (karena ini container dasar) dan jalankan optimasi
RUN cp .env.example .env \
    && php artisan key:generate \
    && php artisan optimize:clear
# Ekspos port yang akan digunakan oleh artisan serve
EXPOSE 8000
# Perintah yang dijalankan saat container menyala
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
