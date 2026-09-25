import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 54,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Richard Jonathan',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'sedanUjiSatuNamaPendekDanSatuNamaPanjang',
                      style: TextStyle(fontSize: 13, color: Color(0xFF006633)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text('NIM: 241401093', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 2),
                    const Text('Ilmu Komputer • Universitas Sumatera Utara',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Profil Pengguna Terverifikasi')),
                          );
                        },
                        style: FilledButton.styleFrom(backgroundColor: const Color(0xFF006633)),
                        child: const Text('Status Aktif'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}