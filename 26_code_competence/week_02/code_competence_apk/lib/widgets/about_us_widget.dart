import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  AboutUs({
    super.key,
  });

  final List<String> _myProducts = [
    'assets/products/img_1.png',
    'assets/products/img_2.png',
    'assets/products/img_3.png',
    'assets/products/img_4.png',
    'assets/products/img_5.png',
    'assets/products/img_6.png',
    'assets/products/img_7.png',
    'assets/products/img_8.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      child: Column(
        children: [
          Text(
            'About Us',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Liburan dengan Kepuasan Hati - Menyediakan Layanan Pendakian yang Profesional, Terpercaya, dan Berpengalaman!',
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _myProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(
                            'Product ${index + 1}',
                            style: const TextStyle(color: Colors.black),
                          ),
                          centerTitle: true,
                          leading: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        body: Center(
                          child: Image.asset(
                            _myProducts[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 193, 227, 236),
                  ),
                  child: Image.asset(
                    _myProducts[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
