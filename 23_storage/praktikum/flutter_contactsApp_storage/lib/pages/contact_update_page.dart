import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'contact_list_page.dart';

class UpdateContactPage extends StatelessWidget {
  const UpdateContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(_createRouteListContact());
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/icons/mobile_friendly.svg',
            ),
            const SizedBox(
              height: 17,
            ),
            const Text(
              'Update Contact',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff1C1B1F),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE7E0EC),
                  labelText: 'Name',
                  hintText: 'Insert Your Name'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE7E0EC),
                  labelText: 'Nomor',
                  hintText: '+62 ....'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color(0xff6750A4),
              ),
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () {
                Navigator.of(context).push(_createRouteListContact());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRouteListContact() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ContactListPage(),
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
