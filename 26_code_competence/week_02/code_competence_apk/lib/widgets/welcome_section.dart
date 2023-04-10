import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.overlay,
            ),
            child: Container(
              width: double.infinity,
              height: 280,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_header.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 180,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Welcome!',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 35, 125, 153),
                            letterSpacing: .5,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    bottom: 0,
                    left: 30,
                    right: 30,
                    child: Text(
                      'Selamat datang di aplikasi kami! Siap untuk menjelajahi dunia baru?',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
