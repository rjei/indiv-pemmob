import 'package:flutter/foundation.dart';
import '../models/activity.dart';

class PlannerStore extends ChangeNotifier {
  final List _activities = List.from(initialActivities);
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  // Getters
  List get activities => _activities;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  int get totalCount => _activities.length;
  int get completedCount => _activities.where((a) => a.isCompleted).length;
  int get favoriteCount => _activities.where((a) => a.isFavorite).length;

  List get favoriteActivities =>
      _activities.where((a) => a.isFavorite).toList();

  List get filteredActivities {
    return _activities.where((act) {
      final matchesSearch = act.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          act.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'Semua' || act.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  // --- CRUD OPERATIONS ---

  // 1. Create
  void addActivity({
    required String title,
    required String category,
    required String description,
    required DateTime date,
  }) {
    final newId = 'ACT-0${_activities.length + 1}';
    _activities.insert(
      0,
      Activity(
        id: newId,
        title: title,
        category: category,
        description: description,
        date: date,
      ),
    );
    notifyListeners();
  }

  // 2. Read (Find by ID)
  Activity? findById(String id) {
    try {
      return _activities.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }

  // 3. Update
  void updateActivity({
    required String id,
    required String title,
    required String category,
    required String description,
    required DateTime date,
  }) {
    final index = _activities.indexWhere((a) => a.id == id);
    if (index != -1) {
      _activities[index].title = title;
      _activities[index].category = category;
      _activities[index].description = description;
      _activities[index].date = date;
      notifyListeners();
    }
  }

  // 4. Delete
  void deleteActivity(String id) {
    _activities.removeWhere((a) => a.id == id);
    notifyListeners();
  }

  // Toggles
  void toggleFavorite(String id) {
    final act = findById(id);
    if (act != null) {
      act.isFavorite = !act.isFavorite;
      notifyListeners();
    }
  }

  void toggleCompleted(String id) {
    final act = findById(id);
    if (act != null) {
      act.isCompleted = !act.isCompleted;
      notifyListeners();
    }
  }

  // Search & Filter
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}