# 📱 Repositori Tugas Individu
> **Note:** Repositori di-push dan ditrack secara berkala ke GitHub mulai dari **Pertemuan 5** (State Management & Study Planner).

## 📚 Ringkasan Materi & Progres Mingguan

| Pertemuan | Topik / Fokus Utama | Output / Deliverables |
|---|---|---|
| **01** | Kontrak, RPS & Relevansi Mobile | Diskusi & Pengenalan Ekosistem |
| **02** | Konsep Android & Arsitektur | Analisis Arsitektur Aplikasi |
| **03** | Platform & Development Environment | Environment Setup & Basic Run |
| **04** | Komponen UI/UX Flutter | Kartu Profil Mahasiswa & Responsivitas Layout |
| **05** | User Interaction & Navigation | Tugas Aplikasi Aktivitas Belajar (*Study Planner*) & Latihan Provider |
| **06+** | Materi Pertemuan Berikutnya | Diperbarui secara berkala sesuai modul |

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
