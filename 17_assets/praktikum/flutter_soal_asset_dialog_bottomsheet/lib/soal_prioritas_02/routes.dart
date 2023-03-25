import 'package:flutter/material.dart';
import 'package:flutter_soal_asset_dialog_bottomsheet/soal_prioritas_02/gridview_page_two.dart';

import '../soal_prioritas_01/gridview_page.dart';
import 'advance_form_page.dart';
import 'date_color_picker.dart';
import 'form_page.dart';

class MyAppRoutes extends StatelessWidget {
  MyAppRoutes({super.key});

  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const FormPage(),
    '/second': (context) => const DateColorPickerPage(),
    '/third': (context) => const GridViewPage(),
    '/fourth': (context) => const AdvanceFormPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp Routes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff6750A4),
          elevation: 10,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FormPage(),
        '/second': (context) => const DateColorPickerPage(),
        '/third': (context) => const AdvanceFormPage(),
        '/fourth': (context) => const GridViewPageTwo(),
      },
    );
  }
}
