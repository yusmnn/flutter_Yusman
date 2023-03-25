import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.purple[50],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff6750A4),
              ),
              accountName: Text(
                "Yusman",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(''),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              title: const Text('Page 3'),
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            ListTile(
              title: const Text('Page 4'),
              onTap: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),
          ],
        ),
      ),
    );
  }
}
