import 'package:ejara/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PaymentMethodScreen has a balance card widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Create the Finders.
    final earningsFinder = find.text('Earnings per day');
    final ejaraFlexFinder = find.text('Ejara Flex');
    final twentyKFinder = find.text('20,000');
    final tenKFinder = find.text('10,000CFA');
    final iconFinder = find.byIcon(Icons.folder_outlined);

    expect(earningsFinder, findsOneWidget);
    expect(ejaraFlexFinder, findsOneWidget);
    expect(twentyKFinder, findsOneWidget);
    expect(tenKFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });
}
