# 🧵 Unknown Tailor & Bespoke — Headless API & Web Company Profile

Aplikasi web profil usaha jahit dan busana kustom (*bespoke tailor*) dengan arsitektur terpisah (*Decoupled Architecture*) menggunakan **Laravel 11 (REST API)** dan **Vue 3 (Frontend SPA)**. 

Repositori ini dikembangkan secara berkelanjutan (*progressive project*) sebagai pemenuhan rangkaian tugas praktikum mata kuliah **Konstruksi dan Evolusi Perangkat Lunak**.

---

## 🌟 Konsep & Arsitektur Utama

1. **Headless Backend (REST API)**:
   - Laravel difokuskan murni sebagai penyedia data JSON (API).
   - Menyediakan *endpoint* untuk manajemen katalog layanan, galeri portofolio jahit, dan kontak.
   - Autentikasi berbasis *Token/Cookie* yang dijamin keamanannya menggunakan **Laravel Sanctum**.
2. **Modern SPA Frontend (Vue 3)**:
   - Antarmuka pengguna (*User Interface*) yang interaktif menggunakan tema *Dark/Slate Blue*.
   - Termasuk sinkronisasi data dari backend secara dinamis dan penanganan *error state*.
3. **Otomatisasi CI/CD & Deployment**:
   - Menerapkan *Pipeline* terstruktur untuk Backend maupun Frontend via **GitHub Actions**.
   - Proses peluncuran otomatis untuk Frontend ke **Vercel** dengan *artifact passing*.

---

## 📌 Status Fitur & Roadmap Evolusi

### ✅ Fase 1 (Tugas 1) — Selesai
*Fondasi Version Control dan API Backend Dasar*
- [x] Inisialisasi Repositori & Strategi Percabangan Git (`main`, `dev`, `feature/*`).
- [x] Setup Backend API Murni (Laravel 11).
- [x] Fitur CRUD REST API Dasar 1 Tabel (Katalog Portofolio).
- [x] Pengujian Unit & Fitur Otomatis (PHPUnit).

### ✅ Fase 2 (Tugas 2) — Selesai
*Pipeline CI/CD 4 Tahap untuk Backend*
- [x] Membuat `.github/workflows/ci.yml`.
- [x] Rantai tahapan: *Build* ➔ *Test* ➔ *Staging* ➔ *Production*.
- [x] Menggunakan fitur *Environments* & *Required Reviewers* di GitHub.

### ✅ Fase 3 (Tugas 3) — Selesai
*Integrasi Frontend Vue 3 & Deployment Vercel*
- [x] Pembuatan *Frontend* SPA menggunakan Vue 3 & Vite di dalam folder `/frontend`.
- [x] Koneksi API via CORS agar Vue bisa memanggil rute `/api/portfolios` Laravel.
- [x] Pipeline CI/CD khusus Frontend (Lint ➔ Test ➔ Build ➔ Deploy).
- [x] *Deployment* ke Production Vercel menggunakan Vercel CLI via GitHub Actions tanpa melakukan *build* ulang.

### ✅ Fase 4 (Tugas 4) — Selesai
*Pengenalan Docker & Containerization Dasar*
- [x] Pembuatan file `.dockerignore` untuk mengecualikan *vendor*, *node_modules*, dll.
- [x] Pembuatan `Dockerfile` *single-stage* untuk membungkus Backend Laravel.
- [x] Implementasi taktik *Layer Caching* dengan menyalin berkas ekstensi/dependensi `composer` terlebih dahulu sebelum salinan kodingan (*source code*).

### ✅ Fase 5 (Tugas 5 - Rilis Saat Ini) — Selesai
*Docker Lanjutan (Multi-stage, Alpine, Security, & GHCR)*
- [x] Refaktor Dockerfile menjadi arsitektur *Multi-stage build* untuk memisahkan tahap kompilasi dan tahap eksekusi.
- [x] Transisi ke *image* `php:8.3-cli-alpine` untuk memangkas ukuran hingga >70%.
- [x] Konfigurasi *Non-root USER* (`www-data`) untuk mencegah risiko peretasan privilese tinggi.
- [x] Implementasi indikator `HEALTHCHECK` untuk memantau waktu hidup (*uptime*) dan kesehatan kontainer.
- [x] Pembuatan alur kerja (*Workflow*) GitHub Actions untuk secara otomatis membangun dan menerbitkan *image* ke **GitHub Container Registry (GHCR)**.

### 🔜 Rencana Fase Mendatang
- [ ] **Fase 6 (Tugas 6)**: *Integrasi Database & Docker Compose* (Menambahkan *service* MySQL/PostgreSQL dan menyatukan jaringan *container* menggunakan `docker-compose.yml`).

---

## 🛠️ Tech Stack

- **Backend**: PHP 8.3+, Laravel 11.x (API Mode)
- **Frontend**: Vue 3, Vite, CSS Native (Dark Theme)
- **Database**: SQLite (In-memory Testing & Development)
- **Tooling**: Composer, npm, Git, GitHub Actions, Vercel CLI, Docker

---

## 🚀 Panduan Menjalankan Secara Lokal

### Opsi A: Menjalankan dengan Docker (Direkomendasikan)
Pastikan Docker Desktop sudah menyala di sistem Anda, lalu jalankan perintah:
```bash
# 1. Bangun image container
docker build -t evolusi-api:latest .

# 2. Jalankan container di latar belakang
docker run -d --name laravel-api -p 8000:8000 evolusi-api:latest
```
*(API akan berjalan di `http://127.0.0.1:8000`)*

### Opsi B: Menjalankan Manual (Native)
Jika tidak menggunakan Docker, jalankan skrip berikut di terminal:
```bash
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan serve
```

### Menjalankan Aplikasi Web (Vue 3)
Buka terminal baru dan arahkan ke folder `frontend`:
```bash
cd frontend
npm install
npm run dev
```
*(Aplikasi web interaktif akan berjalan di `http://localhost:5173`)*

---

## 🌿 Struktur Percabangan (Branching Model)

- `main` ➔ Branch rilis stabil yang terkoneksi langsung dengan *deployment* Vercel dan rilis *package* GHCR.
- `dev` ➔ Branch utama integrasi pengembangan.
- `feature/*` ➔ Branch pengerjaan fitur individual yang digabungkan ke `dev` melalui *Pull Request*.
