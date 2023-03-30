import 'package:flutter/material.dart';
import '../widgets/routes.dart';
import 'package:provider/provider.dart';
import 'providers/list_contacts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactsModel(),
        ),
      ],
      child: const MyAppRoutes(),
    ),
  );
}
