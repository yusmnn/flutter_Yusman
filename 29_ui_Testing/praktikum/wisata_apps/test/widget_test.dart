import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wisata_bandung_apps/pages/main_screen.dart';

void main() {
  testWidgets('Memiliki header appBar "Wisata Bandung"',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScreen(),
      ),
    );
    expect(find.text('Wisata Bandung'), findsOneWidget);
  });
  testWidgets('Memiliki ListView wisata bandung', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScreen(),
      ),
    );
    expect(find.byType(LayoutBuilder), findsOneWidget);
  });
}
