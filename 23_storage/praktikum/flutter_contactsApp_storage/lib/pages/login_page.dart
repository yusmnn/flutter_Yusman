import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contacts_form_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _obscureText = true;
  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
    if (newUser == false) {
      if (context.mounted) {
        Navigator.of(context).pushReplacement(_createContactFormPage());
      }
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 17,
            ),
            Text(
              'ContactApp',
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Form(
              key: _formLoginKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _userNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xffE7E0EC),
                        labelText: 'User Name',
                        hintText: 'Your Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama harus diisi oleh user';
                      } else if (value.contains(RegExp(r'[0-9]')) ||
                          value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'Nama tidak boleh mengandung angka atau karakter khusus';
                      } else if (value.split(' ').any((element) =>
                          element[0] != element[0].toUpperCase())) {
                        return 'Setiap kata harus dimulai dengan huruf kapital';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffE7E0EC),
                      labelText: 'Password',
                      hintText: 'Your Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xff6750A4),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password harus diisi oleh user';
                      } else if (value.length < 8) {
                        return 'Panjang Password Minimal 8 Karakter';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                final isValidForm = _formLoginKey.currentState!.validate();
                String userName = _userNameController.text;

                if (isValidForm) {
                  loginData.setBool('login', false);
                  loginData.setString('username', userName);
                  Navigator.of(context)
                      .pushReplacement(_createContactFormPage());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red[400],
                      content: const Text('Mohon mengisi form dengan benar'),
                    ),
                  );
                }
              },
              child: Container(
                height: 48,
                width: 148,
                decoration: BoxDecoration(
                  color: const Color(0xff6750A4),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createContactFormPage() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ContactFormPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticOut;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
