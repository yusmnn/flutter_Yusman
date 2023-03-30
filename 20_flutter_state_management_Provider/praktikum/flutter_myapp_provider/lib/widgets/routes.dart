import 'package:flutter/material.dart';

import '../soal_praktikum/contact_page.dart';
import '../soal_praktikum/gridview_page_03.dart';

class MyAppRoutes extends StatelessWidget {
  const MyAppRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp Provider',
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
      routes: <String, WidgetBuilder>{
        '/': (context) => const MyContactPage(),
        '/gridViewPage': (context) => const GridViewPageTwo(),
      },
    );
  }
}
