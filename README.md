# 📱 Repositori Tugas Individu
> **Note:** Repositori di-push dan ditrack secara berkala ke GitHub mulai dari **Pertemuan 5** (State Management & Study Planner).

## 📚 Ringkasan Materi & Progres Mingguan

| Pertemuan | Topik / Fokus Utama | Output / Deliverables | Demo                                             | Materi |
|---|---|---|--------------------------------------------------|--------|
| **01** | Kontrak, RPS & Relevansi Mobile | Diskusi & Pengenalan Ekosistem | -                                                |_soon_|
| **02** | Konsep Android & Arsitektur | Analisis Arsitektur Aplikasi | -                                                | _soon_|
| **03** | Platform & Development Environment | Environment Setup & Basic Run | -                                                |_soon_|
| **04** | Komponen UI/UX Flutter | Kartu Profil Mahasiswa & Responsivitas Layout | -                                                |_soon_|
| **05** | User Interaction & Navigation | Tugas Aplikasi Aktivitas Belajar (*Study Planner*) & Latihan Provider | [Demo Pertemuan 5](https://youtu.be/0yS6mQI-ASs) |_soon_|
| **06+** | Materi Pertemuan Berikutnya | Diperbarui secara berkala sesuai modul | -                                                | _soon_|

### 🚀 Cara Menjalankan Proyek

Gunakan perintah `flutter run` dengan argumen target (`-t`) untuk memilih file yang ingin dijalankan.
#### Proyek Berjalan — Study Planner

Study Planner dengan 6 layar utama:
```bash
flutter run
```

Latihan Modul lainnya:
```bash
flutter run -t lib/main_local.dart
flutter run -t lib/main_catalog.dart
flutter run -t lib/main_favorites.dart
 ```

### 📂 Struktur Direktori Proyek
```text
indiv-pemmob/
├── assets/             # Asset gambar & media
├── reports/            # Laporan PDF & dokumentasi pertemuan
├── lib/
│   ├── models/         # Data model (Activity & Course)
│   ├── state/          # State management (PlannerStore & CourseStore)
│   ├── widgets/        # Reusable UI components (ActivityCard, dsb.)
│   ├── screens/        # Screen / halaman aplikasi (6 layar utama)
│   ├── main.dart       # Entry point utama (Study Planner)
│   └── main_*.dart     # Entry point latihan modul terpisah
└── pubspec.yaml