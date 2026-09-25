#!/bin/bash
set -e

echo "1. Memasuki mode maintenance (php artisan down)..."
php artisan down || true

echo "2. Menarik kode terbaru dari branch main (git pull)..."
git pull origin main

echo "3. Menginstall dependensi backend (composer install)..."
composer install --no-dev --optimize-autoloader --no-interaction

echo "4. Menjalankan migrasi database (php artisan migrate)..."
php artisan migrate --force

echo "5. Membangun aset frontend (pnpm run build)..."
pnpm install --frozen-lockfile
pnpm run build

echo "6. Melakukan caching konfigurasi dan rute Laravel..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "7. Mengembalikan ke mode aktif (php artisan up)..."
php artisan up

echo "Deployment berhasil diselesaikan!"
