import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';

class RouterWidget extends StatelessWidget {
  const RouterWidget({
    super.key,
  });

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
              'Yusman',
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
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesName.contactPage);
            },
          ),
          ListTile(
            title: const Text('Image Generator'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RoutesName.imageGenerate);
            },
          ),
        ],
      ),
    );
  }
}
