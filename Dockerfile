# ==========================================
# STAGE 1: BUILDER (Fase Membangun)
# Tahap pertama boleh besar (menggunakan composer utuh)
# ==========================================
FROM composer:2.7 AS builder
WORKDIR /app

# Strategi Caching: Copy daftar dependensi terlebih dahulu
COPY composer.json composer.lock ./

# Install dependensi (bisa ditambah --no-dev agar lebih kecil lagi)
RUN composer install --no-interaction --prefer-dist --ignore-platform-reqs --no-scripts --optimize-autoloader

# Copy sisa kodingan aplikasi
COPY . .

# ==========================================
# STAGE 2: PRODUCTION (Fase Menjalankan)
# Tahap kedua super kecil menggunakan Alpine Linux
# ==========================================
FROM php:8.3-cli-alpine

# Install ekstensi minimal yang dibutuhkan aplikasi
RUN apk add --no-cache sqlite-dev \
    && docker-php-ext-install pdo_mysql pdo_sqlite

# Set folder kerja
WORKDIR /var/www

# Salin kodingan yang sudah matang dari tahap builder
COPY --from=builder /app /var/www

# Ganti kepemilikan file agar bisa dibaca/ditulis oleh user non-root
RUN chown -R www-data:www-data /var/www

# SYARAT TUGAS 4 & 5: Container tidak boleh berjalan sebagai root!
USER www-data

# Siapkan environment dan jalankan migrasi database (Sebagai www-data)
RUN cp .env.example .env \
    && touch database/database.sqlite \
    && php artisan key:generate \
    && php artisan migrate --force

# Ekspos port
EXPOSE 8000

# SYARAT TUGAS 5: Healthcheck untuk memantau status aplikasi
# Mengecek rute default /up bawaan Laravel 11 setiap 15 detik
HEALTHCHECK --interval=15s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:8000/up || exit 1

# Perintah menjalankan server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]

