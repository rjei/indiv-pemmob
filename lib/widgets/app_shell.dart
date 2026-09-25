import 'package:flutter/material.dart';

/// AppShell is a base scaffold shell used for layout composition.
/// Navigation is handled by MainNavigationShell in main.dart.
class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}