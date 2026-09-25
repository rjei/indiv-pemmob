import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/planner_store.dart';
import '../widgets/activity_card.dart';
import 'activity_detail_screen.dart';

class ActivityListScreen extends StatelessWidget {
  const ActivityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PlannerStore>();
    final categories = ['Semua', 'Pemrograman', 'Bahasa', 'Desain', 'Matematika'];

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Aktivitas Belajar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari aktivitas...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: (val) => store.setSearchQuery(val),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = store.selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: const Color(0xFF006633),
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                      onSelected: (_) => store.setCategory(cat),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: store.filteredActivities.isEmpty
                  ? const Center(child: Text('Tidak ada aktivitas ditemukan.'))
                  : ListView.builder(
                itemCount: store.filteredActivities.length,
                itemBuilder: (context, index) {
                  final act = store.filteredActivities[index];
                  return ActivityCard(
                    activity: act,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ActivityDetailScreen(activityId: act.id),
                        ),
                      );
                    },
                    onFavoriteToggle: () => store.toggleFavorite(act.id),
                    onCompleteToggle: () => store.toggleCompleted(act.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}