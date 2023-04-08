import 'package:flutter/material.dart';
import 'package:flutter_rest_api/request_api/post.dart';

import '../dice_bear_app/dice_bear.dart';
import '../request_api/deserialisasi.dart';
import '../request_api/put.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            title: const Text('Post Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Deserialization Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeserialisasiPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Put Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PutPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Dice Bear Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiceBearPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
