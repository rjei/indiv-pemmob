import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/planner_store.dart';
import '../widgets/activity_card.dart';
import 'activity_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PlannerStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Planner', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF006633), Color(0xFF00994D)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Halo, Richard! 👋',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 6),
                        Text('Kelola jadwal dan aktivitas belajar harianmu dengan rapi.',
                            style: TextStyle(fontSize: 13, color: Colors.white70)),
                      ],
                    ),
                  ),
                  Icon(Icons.menu_book_rounded, size: 48, color: Colors.white24),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Statistik Belajar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildStatCard('Total Target', '${store.totalCount}', Colors.blue),
                const SizedBox(width: 12),
                _buildStatCard('Selesai', '${store.completedCount}', Colors.green),
                const SizedBox(width: 12),
                _buildStatCard('Favorit', '${store.favoriteCount}', Colors.red),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Aktivitas Mendatang', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('${store.activities.length} Aktivitas', style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: store.activities.take(4).length,
              itemBuilder: (context, index) {
                final act = store.activities[index];
                return ActivityCard(
                  activity: act,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ActivityDetailScreen(activityId: act.id)),
                    );
                  },
                  onFavoriteToggle: () => store.toggleFavorite(act.id),
                  onCompleteToggle: () => store.toggleCompleted(act.id),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12, color: color.withValues(alpha: 0.8))),
          ],
        ),
      ),
    );
  }
}