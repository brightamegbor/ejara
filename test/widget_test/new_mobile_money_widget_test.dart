import 'package:ejara/ui/new_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('New wallet screen has a new momo text',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    final newMoMoFinder = find.text("New mobile money");

    expect(newMoMoFinder, findsOneWidget);
  });

  testWidgets('New wallet screen has text fields', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    Finder textFields = find.byType(TextField);

    expect(textFields, findsWidgets);
  });

  testWidgets('New wallet screen has phone field and accepts input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    Finder phoneField = find.byType(TextField).first;

    // Enter '696920908' into the TextField.
    await tester.enterText(phoneField, '6969209');

    final phoneFieldValue =
        (phoneField.evaluate().first.widget as TextField).controller?.text;

    expect(phoneFieldValue, "6969209");
  });

  testWidgets(
      'New wallet screen has phone field and accepts input and formats it',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    Finder phoneField = find.byType(TextField).first;

    // Enter '696920908' into the TextField.
    await tester.enterText(phoneField, '696920908');

    final phoneFieldValue =
        (phoneField.evaluate().first.widget as TextField).controller?.text;

    expect(phoneFieldValue, "6 96 92 09 08");
  });

  testWidgets(
      'New wallet screen has phone field and accepts only numbers input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    Finder phoneField = find.byType(TextField).first;

    // Enter '696920908' into the TextField.
    await tester.enterText(phoneField, 'BRFGTTDG');

    final phoneFieldValue =
        (phoneField.evaluate().first.widget as TextField).controller?.text;

    expect(phoneFieldValue, "");
  });

  testWidgets('New wallet screen has name field and accepts input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    Finder nameField = find.byType(TextField).last;

    // Enter '696920908' into the TextField.
    await tester.enterText(nameField, 'Bright Amegbor');

    final phoneFieldValue =
        (nameField.evaluate().first.widget as TextField).controller?.text;

    expect(phoneFieldValue, "Bright Amegbor");
  });

  testWidgets('Close new wallet screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewWallet(
        // key: key,
        paymentMethod: "mobile money",
      ),
    ));

    final newMoMoFinder = find.text("New mobile money");

    // find text first
    expect(newMoMoFinder, findsOneWidget);

    Finder dismissButton = find.byType(IconButton).first;

    // dismiss screen
    await tester.tap(dismissButton);

    await tester.pumpAndSettle();

    expect(newMoMoFinder, findsNothing);
  });
}
