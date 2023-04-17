import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 229, 248, 252),
        child: ListView(children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person_2_rounded,
                size: 28, color: Colors.black87),
            title: const Text('About Us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phone_rounded,
                size: 28, color: Colors.black87),
            title: const Text('Contact Us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.login_rounded,
                size: 28, color: Colors.black87),
            title: const Text('Log Out'),
            onTap: () {},
          ),
        ]));
  }
}
