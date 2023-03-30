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
              title: const Text('Contact Page'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('GridView Page'),
              onTap: () {
                Navigator.pushNamed(context, '/gridViewPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
