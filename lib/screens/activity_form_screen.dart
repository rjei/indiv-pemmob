import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/activity.dart';
import '../state/planner_store.dart';

class ActivityFormScreen extends StatefulWidget {
  final Activity? activityToEdit;

  const ActivityFormScreen({super.key, this.activityToEdit});

  @override
  State<ActivityFormScreen> createState() => _ActivityFormScreenState();
}

class _ActivityFormScreenState extends State<ActivityFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  String _selectedCategory = 'Pemrograman';
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.activityToEdit?.title ?? '');
    _descController = TextEditingController(text: widget.activityToEdit?.description ?? '');
    if (widget.activityToEdit != null) {
      _selectedCategory = widget.activityToEdit!.category;
      _selectedDate = widget.activityToEdit!.date;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final store = context.read<PlannerStore>();
      if (widget.activityToEdit == null) {
        store.addActivity(
          title: _titleController.text.trim(),
          category: _selectedCategory,
          description: _descController.text.trim(),
          date: _selectedDate,
        );
      } else {
        store.updateActivity(
          id: widget.activityToEdit!.id,
          title: _titleController.text.trim(),
          category: _selectedCategory,
          description: _descController.text.trim(),
          date: _selectedDate,
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.activityToEdit != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Aktivitas' : 'Tambah Aktivitas Baru')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Aktivitas *',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Judul wajib diisi!';
                  if (val.trim().length < 3) return 'Judul minimal 3 karakter!';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Kategori Belajar',
                  border: OutlineInputBorder(),
                ),
                items: ['Pemrograman', 'Bahasa', 'Desain', 'Matematika']
                    .map((cat) => DropdownMenuItem<String>(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedCategory = val!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi / Catatan *',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Deskripsi wajib diisi!';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text('Tanggal: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                  const Spacer(),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.date_range),
                    label: const Text('Pilih Tanggal'),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                      if (picked != null) setState(() => _selectedDate = picked);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _saveForm,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF006633),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(isEditing ? 'Simpan Perubahan' : 'Tambah Aktivitas'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}