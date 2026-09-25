import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:pemmob/main.dart';
import 'package:pemmob/state/planner_store.dart';

void main() {
  testWidgets('StudyPlannerApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => PlannerStore(),
        child: const StudyPlannerApp(),
      ),
    );

    // Verify that the bottom navigation bar renders.
    expect(find.text('Beranda'), findsOneWidget);
  });
}
