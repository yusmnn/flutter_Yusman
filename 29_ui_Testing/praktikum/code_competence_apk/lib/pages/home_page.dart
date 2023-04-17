import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/about_us_widget.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/float_botton.dart';
import '../widgets/header_widget.dart';
import '../widgets/contact_us_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/welcome_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MandakiApp',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 147, 222, 244),
          secondary: Color.fromARGB(255, 8, 42, 53),
        ),
        fontFamily: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(255, 8, 42, 53),
        ).fontFamily,
      ),
      home: const MyAboutPage(),
    );
  }
}

class MyAboutPage extends StatefulWidget {
  const MyAboutPage({super.key});

  @override
  State<MyAboutPage> createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _message = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const HeaderSection(),
      endDrawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeSection(),
            ContactUs(
              formKey: _formKey,
              firstName: _firstName,
              lastName: _lastName,
              email: _email,
              message: _message,
            ),
            AboutUs(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatButton(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
