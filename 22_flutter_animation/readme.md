## Resume Materi KMFlutter - Flutter Animation
### Animation
  - Animasi membuat aplikasi terlihat hidup
  - widget yang bergerak menambah daya tarik
  - Pergerakan dari kondisi A ke kondisi B

### Implicit Animation
  - versi animasi dari widget yang sudah ada
    ```
      //state
      bool isBig = false;

      // container akan berubah dari kecil kebesar.
      // tetapi perubahan tampak kaku
      Container(
        width: isBig ? 200 : 100,
        height: isBig ? 200 : 100,
        color: Colos.red,
      )
    ```
  - Dengan animasi menggunakan AnimatedContainer
    ```
      //state
      bool isBig = false;

      // container akan berubah dari kecil kebesar.
      // perubahan lebih halus
      AnimatedContainer(
        width: isBig ? 200 : 100,
        height: isBig ? 200 : 100,
        color: Colos.red,
        duration: const Duration(milliseconds: 300),
      )
    ```
### Transition
  - Animasi yang terjadi pada saat perpindahan halaman
  - Dilakukan pada bagian Navigator.push()
    ```
      /// function
      Route _createRouteListContact() {
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 3000),
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

      /// onPressed
      onPressed: () {
          Navigator.of(context).push(_createRouteListContact());
      },
    ```
### Transition Umum
  - fadeTransition: halaman muncul dengan efek redup ketampak jelas secara penuh
    ```
      final tween = Tween(begin: 0.0, end: 1.0);

      return fadeTransition(
        opacity: aniamtion.drive(Tween),
        child: child,
      )
    ```
  - scaleTransition: halaman muncul dengan efek berubah ukuran dari tidak penuh menuju tampil keseluruhan
    ```
      final tween = Tween(begin: 0.0, end: 1.0);

      return scaleTransition(
        opacity: aniamtion.drive(Tween),
        child: child,
      )
    ```
