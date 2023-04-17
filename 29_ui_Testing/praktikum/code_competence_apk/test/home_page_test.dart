import 'package:code_competence_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String header = 'Welcome!';
  const String headerText =
      'Selamat datang di aplikasi kami! Siap untuk menjelajahi dunia baru?';
  const String description =
      'Liburan dengan Kepuasan Hati - Menyediakan Layanan Pendakian yang Profesional, Terpercaya, dan Berpengalaman!';
  const String titleContact = 'Contact Us';
  const String titleAbout = 'About Us';

  testWidgets('Memiliki Header dengan teks "Welcome"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.text(headerText), findsOneWidget);
  });

  testWidgets('Memiliki Title dengan teks "Contact Us"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.text(titleContact), findsOneWidget);
  });
  testWidgets('Memiliki Deskripsi"', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.text(description), findsOneWidget);
  });

  testWidgets('Memiliki Title dengan teks "About Us"',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.text(titleAbout), findsOneWidget);
  });

  testWidgets('Memiliki section teks yang menarik user',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    expect(find.text(header), findsOneWidget);
  });

  testWidgets('Memiliki AppBar yang berisi logo', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('Memiliki Section dengan gambar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byKey(const Key('welcome_section')), findsOneWidget);
  });

  testWidgets('Memiliki Section Form Contact', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byKey(const Key('form_contact_us')), findsOneWidget);
  });

  testWidgets('Memiliki Tampilan untuk barang', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('Memiliki Bottom Navigation', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.byType(BottomAppBar), findsOneWidget);
  });
}
