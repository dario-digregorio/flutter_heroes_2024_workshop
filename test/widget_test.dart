// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_heroes_2024_workshop/pages/counter_detail_page.dart';
import 'package:flutter_heroes_2024_workshop/pages/counters_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_heroes_2024_workshop/main.dart';

void main() {
  testWidgets('should have only CountersPage', (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(500, 800);

    await tester.pumpWidget(MyApp());

    expect(find.byType(CountersPage), findsOneWidget);
    expect(find.byType(CounterDetailPage), findsNothing);
  });

  testWidgets('should have CountersPage and Detail',
      (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(800, 1200);

    await tester.pumpWidget(MyApp());

    expect(find.byType(CountersPage), findsOneWidget);
    expect(find.byType(CounterDetailPage), findsOneWidget);
  });
}
