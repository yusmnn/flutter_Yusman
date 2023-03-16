## Resume Materi – Platform Widget
### Flutter Platform
  - memanfaatkan widget dengan gaya berbeda
  - MaterialApp (Android)
  - CupertinoApp (IOS)

### MaterialApp
  - Widget dasar yang mengemas seluruh widget dalam aplikasi
  - widget yang digunakan pada sistem android
  - di import dari ``` package:flutter/material.dart ```
  - widget yang pertama kali dibuka, diletakkan pada bagian 'home'
    ```
      MaterialApp(
        theme: ThemeData.dark(), // mengatur tema aplikasi
        home: const HomePage(), // Halaman utama
      );
    ``` 
  - megatur halaman juga bisa digunakan dengan menggunakan routes dan initialRoute
    ```
      MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: 'home', // route utama
        routes: {
          'home': (_) => const HomePage(), // mendaftarkan halaman pada routes
        }
      );
    ```
  - Scaffold(): widget dasar yang digunakan unutk membuat sebuah halaman pada MaterialApp()
  - membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti
  ```
    Scaffold(
      appBar: Appbar(
        // widget Appbar
      )
      drawer: Drawer(
        // widget Drawer
      )
      body: ..., // bagian utama
      bottomNavigationBar: BottomNavigationBar(
        // widget BottomNavigationBar
      )
    );
  ```

### CupertinoApp
  - widget dasar yang mengemas seluruh widget dalam aplikasi
  - widget yang digunakan pada sistem IOS
  - di import dari package ``` package: flutter/cupertino.dart ```
  - Cupertino tidak mneyediakan 'Themedata.dark() seperti pada Material
  - bisa menggunakan variable untuk menyimpan tema
    ```
      final _themaDark = const CupertinoThemedata.raw( // membuat dasar thema
        Brightness.dark, // mengatur brightness tema menjadi dark
        null,
        null,
        null,
        null,
        null,
      )

    ```
  - widget yang pertama kali dibuka, diletakkan pada bagian home.
    ```
      CupertinoApp(
        theme: _themeDark;
        home: const HomePage();
      );
    ```
  - CupertinoPageScaffold(): widget dasar untuk membangun sebuah halaman pada sebuah CupertinoApp
  - membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti
    ```
      CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // block code
        ),
        child:..., // Bagian utama
      );
    ```
    