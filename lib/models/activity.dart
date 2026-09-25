class Activity {
  final String id;
  String title;
  String category; // Pemrograman, Bahasa, Desain, Matematika
  String description;
  DateTime date;
  bool isCompleted;
  bool isFavorite;

  Activity({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.date,
    this.isCompleted = false,
    this.isFavorite = false,
  });
}

// Minimal 10 Data Dummy dengan ID Unik & Kategori
final List initialActivities = [
  Activity(
    id: 'ACT-001',
    title: 'Praktikum Pemrograman Mobile',
    category: 'Pemrograman',
    description: 'Mengerjakan tugas Study Planner Flutter dengan Provider.',
    date: DateTime.now().add(const Duration(hours: 2)),
    isFavorite: true,
  ),
  Activity(
    id: 'ACT-002',
    title: 'Belajar Kosakata Mandarin',
    category: 'Bahasa',
    description: 'Menghafal 20 kata baru untuk percakapan harian.',
    date: DateTime.now().add(const Duration(days: 1)),
    isFavorite: true,
  ),
  Activity(
    id: 'ACT-003',
    title: 'Review Material UI/UX Design',
    category: 'Desain',
    description: 'Memahami prinsip visual hierarchy dan layouting.',
    date: DateTime.now().add(const Duration(days: 2)),
  ),
  Activity(
    id: 'ACT-004',
    title: 'Latihan Soal Aljabar Linear',
    category: 'Matematika',
    description: 'Menyelesaikan bab matriks dan eliminasi Gauss.',
    date: DateTime.now().add(const Duration(days: 3)),
  ),
  Activity(
    id: 'ACT-005',
    title: 'Setup Spring Boot Project',
    category: 'Pemrograman',
    description: 'Konfigurasi JPA, PostgreSQL, dan REST API endpoints.',
    date: DateTime.now().add(const Duration(days: 4)),
    isFavorite: true,
  ),
  Activity(
    id: 'ACT-006',
    title: 'Latihan Membaca Pinyin',
    category: 'Bahasa',
    description: 'Melatih nada dan intonasi nada 1 sampai 4.',
    date: DateTime.now().add(const Duration(days: 5)),
  ),
  Activity(
    id: 'ACT-007',
    title: 'Slicing Wireframe ke Figma',
    category: 'Desain',
    description: 'Membuat komponen reusable dan kustomisasi warna di Figma.',
    date: DateTime.now().add(const Duration(days: 6)),
  ),
  Activity(
    id: 'ACT-008',
    title: 'Kuis Struktur Data',
    category: 'Pemrograman',
    description: 'Materi seputar Tree, Binary Search, dan Graph Algorithm.',
    date: DateTime.now().add(const Duration(days: 7)),
    isCompleted: true,
  ),
  Activity(
    id: 'ACT-009',
    title: 'Kalkulus Lanjut: Integrasi Parsial',
    category: 'Matematika',
    description: 'Mengerjakan latihan bab 4 lembar kerja mahasiswa.',
    date: DateTime.now().add(const Duration(days: 8)),
  ),
  Activity(
    id: 'ACT-010',
    title: 'Evaluasi Proyek Akhir Semester',
    category: 'Pemrograman',
    description: 'Meeting sinkronisasi progress aplikasi mobile.',
    date: DateTime.now().add(const Duration(days: 9)),
    isCompleted: true,
  ),
];