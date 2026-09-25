import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onCompleteToggle;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.onTap,
    required this.onFavoriteToggle,
    required this.onCompleteToggle,
  });

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Pemrograman':
        return Colors.blue.shade700;
      case 'Bahasa':
        return Colors.orange.shade700;
      case 'Desain':
        return Colors.purple.shade700;
      case 'Matematika':
        return Colors.teal.shade700;
      default:
        return const Color(0xFF006633);
    }
  }

  @override
  Widget build(BuildContext context) {
    final catColor = _getCategoryColor(activity.category);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Checkbox(
          value: activity.isCompleted,
          activeColor: const Color(0xFF006633),
          onChanged: (_) => onCompleteToggle(),
        ),
        title: Text(
          activity.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: activity.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: catColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                activity.category,
                style: TextStyle(fontSize: 12, color: catColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${activity.date.day}/${activity.date.month}/${activity.date.year} • ${activity.description}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            activity.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: activity.isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}