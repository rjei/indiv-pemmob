import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/planner_store.dart';
import 'activity_form_screen.dart';

class ActivityDetailScreen extends StatelessWidget {
  final String activityId;

  const ActivityDetailScreen({super.key, required this.activityId});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PlannerStore>();
    final activity = store.findById(activityId);

    if (activity == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Aktivitas')),
        body: const Center(child: Text('Aktivitas tidak ditemukan.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activity.id),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActivityFormScreen(activityToEdit: activity),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              store.deleteActivity(activity.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Aktivitas berhasil dihapus')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
              label: Text(activity.category, style: const TextStyle(color: Colors.white)),
              backgroundColor: const Color(0xFF006633),
            ),
            const SizedBox(height: 16),
            Text(activity.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  '${activity.date.day}/${activity.date.month}/${activity.date.year}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 20),
                Icon(
                  activity.isCompleted ? Icons.check_circle : Icons.pending,
                  size: 16,
                  color: activity.isCompleted ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 6),
                Text(
                  activity.isCompleted ? 'Selesai' : 'Belum Selesai',
                  style: TextStyle(
                    color: activity.isCompleted ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            const Text('Deskripsi / Catatan:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(activity.description, style: const TextStyle(fontSize: 16, height: 1.4)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => store.toggleCompleted(activity.id),
                icon: Icon(activity.isCompleted ? Icons.undo : Icons.check),
                label: Text(activity.isCompleted ? 'Tandai Belum Selesai' : 'Tandai Selesai'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF006633),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}