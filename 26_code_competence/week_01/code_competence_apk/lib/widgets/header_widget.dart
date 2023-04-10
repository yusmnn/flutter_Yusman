import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget implements PreferredSizeWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      title: Image.asset(
        'assets/images/logo.png',
        width: 124,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
