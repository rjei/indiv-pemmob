import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/planner_store.dart';
import 'screens/home_screen.dart';
import 'screens/activity_list_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/activity_form_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlannerStore(),
      child: const StudyPlannerApp(),
    ),
  );
}

class StudyPlannerApp extends StatelessWidget {
  const StudyPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006633),
          primary: const Color(0xFF006633),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationShell(),
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ActivityListScreen(),
          FavoritesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF006633),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt_rounded), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
        ],
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ActivityFormScreen()),
          );
        },
        backgroundColor: const Color(0xFF006633),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Tambah', style: TextStyle(color: Colors.white)),
      )
          : null,
    );
  }
}