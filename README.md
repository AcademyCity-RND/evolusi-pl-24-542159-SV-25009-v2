# 🧵 Unknown Tailor & Bespoke — Headless API & Web Company Profile

Aplikasi web profil usaha jahit dan busana kustom (*bespoke tailor*) dengan arsitektur terpisah (*Decoupled Architecture*) menggunakan **Laravel 11 (REST API)** dan **Vue 3 (Frontend SPA)**. 

Repositori ini dikembangkan secara berkelanjutan (*progressive project*) sebagai pemenuhan rangkaian tugas praktikum mata kuliah **Konstruksi dan Evolusi Perangkat Lunak**.

---

## 🌟 Konsep & Arsitektur Utama

1. **Headless Backend (REST API)**:
   - Laravel difokuskan murni sebagai penyedia data JSON (API).
   - Menyediakan *endpoint* untuk manajemen katalog layanan, galeri portofolio jahit, dan kontak.
   - Autentikasi berbasis *Token/Cookie* yang dijamin keamanannya menggunakan **Laravel Sanctum**.
2. **Modern SPA Frontend (Vue 3) - *Upcoming***:
   - Antarmuka pengguna (*User Interface*) yang sangat reaktif.
   - Meliputi layar pembuka interaktif, dan galeri dinamis (*Hover-to-reveal* & *Single-lock active*).
3. **Otomatisasi CI/CD & Deployment**:
   - Menerapkan *Pipeline* terstruktur (Build -> Test -> Staging -> Production) via GitHub Actions.
   - Proses peluncuran yang aman menggunakan perlindungan *Branch Protection* dan *Environment Reviewers*.

---

## 📌 Status Fitur & Roadmap Evolusi

### ✅ Fase 1 (Tugas 1 - Rilis Saat Ini)
*Fondasi Version Control dan API Backend Dasar*
- [x] Inisialisasi Repositori & Strategi Percabangan Git (`main`, `dev`, `feature/*`).
- [x] Setup Backend API Murni (Laravel 11).
- [x] Fitur CRUD REST API Dasar 1 Tabel (Misal: Manajemen Galeri Portofolio).
- [x] Pengujian Unit & Fitur Otomatis (PHPUnit).
- [x] Konfigurasi Dasar GitHub Actions CI (Linting & Testing).

### 🔜 Rencana Fase Mendatang
- [ ] **Fase 2 (Tugas 2)**: Perluasan Pipeline CI/CD menjadi 4 tahap dengan simulasi *deployment* (*Staging & Production*).
- [ ] **Fase 3 (Tugas 3)**: Pembuatan *Frontend* Vue 3 di folder `/frontend` (mewujudkan tampilan *Splash Screen* dan Galeri Interaktif), beserta CI khusus *frontend*.
- [ ] **Fase 4 (Tugas 4)**: *Containerization* menggunakan Docker (`Dockerfile` & `.dockerignore`) untuk mempermudah eksekusi server lintang *platform*.

---

## 🛠️ Tech Stack

- **Backend**: PHP 8.3+, Laravel 11.x (API Mode)
- **Frontend**: Vue 3, TailwindCSS, Vite *(Mulai Tugas 3)*
- **Auth**: Laravel Sanctum (Breeze API)
- **Database**: MySQL (Laragon Local Environment) & SQLite (In-memory Testing)
- **Tooling**: Composer, Git, GitHub Actions, Docker *(Mulai Tugas 4)*

---

## 🚀 Panduan Menjalankan API Secara Lokal

### 1. Kloning Repositori
```bash
git clone https://github.com/KEPL2026/evolusi-pl-24-542159-SV-25009-v1.git
cd evolusi-pl-24-542159-SV-25009-v1
```

### 2. Instalasi Dependensi Backend
```bash
composer install
```

### 3. Konfigurasi Lingkungan (.env)
Salin file konfigurasi lingkungan dan sesuaikan kredensial basis data Anda:
```bash
cp .env.example .env
php artisan key:generate
```

Pastikan konfigurasi database di `.env` sesuai dengan server lokal Anda:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=evolusi_pl
DB_USERNAME=root
DB_PASSWORD=
```

### 4. Migrasi Database & Pengujian
Jalankan migrasi tabel ke basis data lokal dan pastikan seluruh *test* berstatus hijau:
```bash
php artisan migrate
php artisan test
```

### 5. Jalankan Server API Lokal
```bash
php artisan serve
```
*(Catatan: Tampilan web interaktif akan ditambahkan pada Tugas 3. Saat ini server hanya merespons panggilan API).*

---

## 🌿 Struktur Percabangan (Branching Model)

- `main` ➔ Branch rilis stabil (dilindungi Branch Protection).
- `dev` ➔ Branch utama integrasi pengembangan.
- `feature/*` ➔ Branch pengerjaan fitur individual yang digabungkan ke `dev` melalui *Pull Request*.
