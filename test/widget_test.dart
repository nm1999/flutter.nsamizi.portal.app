import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nsamizi_portal/main.dart';

void main() {
  testWidgets('app launches with the academic portal branding and dashboard', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Academic Portal'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back, Nia'), findsOneWidget);
    expect(find.text('Quick actions'), findsOneWidget);
  });
}
