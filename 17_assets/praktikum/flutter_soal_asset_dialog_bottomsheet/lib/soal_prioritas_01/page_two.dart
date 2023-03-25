import 'package:flutter/material.dart';
import 'package:flutter_soal_asset_dialog_bottomsheet/soal_prioritas_01/gridview_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.purple,
            shape: CircleBorder(),
          ),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const GridViewPage(),
              ),
              (route) => route.isFirst,
            ),
          ),
        ),
      ),
    );
  }
}
