import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact_bloc.dart';
import 'pages/contacts_form_page.dart';

void main() {
  runApp(const MyAppContact());
}

class MyAppContact extends StatelessWidget {
  const MyAppContact({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactBloc()),
      ],
      child: MaterialApp(
        title: 'Contact BloC',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const ContactFormPage(),
      ),
    );
  }
}
