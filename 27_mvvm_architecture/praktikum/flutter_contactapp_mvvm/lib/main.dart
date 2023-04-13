import 'package:flutter/material.dart';
import 'package:flutter_contactapp_mvvm/utils/routes/routes.dart';

import 'package:provider/provider.dart';

import 'views/screens/contact_app/contact_view_model.dart';

import 'views/screens/dice_bear_app/dice_bear_view_model.dart';

import 'utils/routes/routes_name.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImageViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: const Color(0xff6750A4),
        ),
        initialRoute: RoutesName.contactPage,
        onGenerateRoute: Routes.generateRoute,
      ),
    ),
  );
}
