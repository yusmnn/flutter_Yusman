## Resume Materi – Introduction Flutter Widget
### Perkenalan Flutter
  - Flutter adalah framework yang digunakan untuk membuat aplikasi mobile, desktop, dan web.
  - keunggulan flutter:
    - Mudah digunakan
    - Produktivitas tinggi
    - dokumentasi lengkap
    - Komunitas yang berkembang
    - Software Development Kit (SDK): alat untuk membantu proses pengembangan
    - Framework: perlengkapan untuk membentuk aplikasi yang dapat di kustomisasi.
  - Membuat Project: flutter create <nama_project>
    ```
      // example: flutter create flutter_project
    ```
  - Menjalankan Project
    ```
      // Masuk ke direktori project
      // jalankan perintah: flutter run
    ```
  - Struktur Direktori
    - andorid
    - ios
    - lib
    - linux
    - macos
    - test
    - web
    - windows
    - .gitignore
    - .metadata
    - README.md
    - analysis_options.yaml
    - config.json
    - pubspec.lock
    - pubspec.yaml
  - directori platform: android, ios, linux, macos, web, windows
  - directori project: 
    - lib -> ruang kerja utama
    - test -> aktivitas pengujian
  - Widget:
    - digunakan untuk membentuk antarmuka (UI)
    - Widget berupa class dan dapat terdiri dari beberapa widget lainnya
### Stateless Widget
  - tidak bergantung pada data perubahan data
  - hanya fokus pada tampilan
  - dibuat dengan extends pada class StatelessWidget
  - example:
    ```
      class MyWidget extends StatelessWidget {
        const MyWidget({super.key});

        @override
        Widget build(BuildContext context) {
          return const MaterialApp(
            home: Scaffold(
              body: Text("Selamat datang di FLutter."),
            ),
          );
        }
      }
    ```
### Stateful Widget
  - mementingkan pada penggunaan data
  - dibuat dengan extends pada class StatefulWidget
  - satu widget menggunakan dua class (state dan widget)
  - example:
    ```
    // class State
      class MyWidget extends StatefulWidget {
        const MyWidget({super.key});

        @override
        State<MyWidget> createState() => _MyWidgetState();
      }

    // class widget
      class _MyWidgetState extends State<MyWidget> {
        @override
        Widget build(BuildContext context) {
          return const MaterialApp(
            home: Scaffold(
              body: Text("Selamat datang di FLutter."),
            ),
          );
        }
      }
    ```
### Built in Widget
  - widget yang dapat langsung digunakan
  - sudah ter-install bersama flutter
    - MaterialApp: membangun aplikasi dengan material
      ```
        const MaterialApp();
      ```
      ```
        const MaterialApp(
          home: Text("Selamat datang di flutter");
        );
      ```
    - Scaffold: Membentuk suatu halaman
      ```
        const Scaffold();
      ```
      ```
        const Scaffold(
          body: Text("Selamat datng di Flutter");
        );
      ```
    - AppBar: Membentuk application bar yang terletak pada bagian atas halaman
      ```
        AppBar();
      ```
      ```
        Appbar(
          title: const Text("Ini Appbar");
        );
      ```
    - Text: widget untuk menampilkan teks
      ```
        const Text(text);
      ```
      ```
        const Text("haloooo...");
      ```
  - Contoh penggunaan widget tersebut:
    ```
      void main() {
        runApp(const MyWidget());
      }
    ```
    ```
      class MyWidget extends StatelessWidget {
        const MyWidget({super.key});

        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Home AppBar"),
              ),
              body: const Text("Selamat datang di FLutter."),
            ),
          );
        }
      }
    ```