import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/planner_store.dart';
import '../widgets/activity_card.dart';
import 'activity_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PlannerStore>();
    final favs = store.favoriteActivities;

    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas Favorit')),
      body: favs.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64, color: Colors.grey),
            SizedBox(height: 12),
            Text('Belum ada aktivitas favorit.', style: TextStyle(color: Colors.grey)),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favs.length,
        itemBuilder: (context, index) {
          final act = favs[index];
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
    );
  }
}