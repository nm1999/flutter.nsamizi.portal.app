import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nsamizi_portal/dashboard.dart';
import 'package:nsamizi_portal/main.dart';

void main() {
  testWidgets('app launches with the academic portal branding and dashboard', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Academic Portal'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back, Nia'), findsOneWidget);
    expect(find.text('Quick actions'), findsOneWidget);
  });

  testWidgets('suggestion box validates and accepts feedback', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: DashboardHome())),
    );

    await tester.tap(find.text('Suggestion box'));
    await tester.pumpAndSettle();
    expect(find.text('Share a suggestion'), findsOneWidget);

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(find.text('Please enter a suggestion first.'), findsOneWidget);

    await tester.enterText(
      find.byType(TextField),
      'Add more past papers for Mathematics.',
    );
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();
    expect(find.text('Suggestion sent'), findsOneWidget);
  });
}
