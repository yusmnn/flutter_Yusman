## Resume Materi – Installation – Command Line Interface
### Flutter CLI (Command-line Interface)
  - Alat yang digunakan untuk berinteraksi dengan Flutter SDK
  - perintah dijalankan dalam terminal
  - ``` flutter doctor ``` untuk menampilkan informasi software yang dibutuhkan flutter
  - ``` flutter create <nama_project> ``` untuk membuat project aplikasi flutter baru di direktory tertentu
  - ``` flutter run <dart_file> ``` untuk menjalankan project flutter di device yang tersedia
  - ``` flutter emulators ``` untuk menampilkan daftar emulator yang terinstall atau membuat emulator baru
  - ``` flutter emulators --launch <EMULATOR_ID> ``` untuk membuka emulator yang sudah terinstall sesuai ID
  - ``` flutter emulators --create [--name xyz] ``` untuk membuat emulator baru
  - ``` flutter channel ``` untuk menampilkan versi flutter dan yang digunakan (master, main, beta, stabel)
  - ``` flutter pub add <package_name> ``` untuk menambahkan package ke dependencies pubspec.yaml
  - ``` flutter pub get ``` untuk mendownload semua package di dependencies pubspeck.yaml
  - ``` flutter build <DIRECTORY> ``` untuk menghasilkan file aplikasi yang dijalankan di platform tertentu, seperti Android, iOS, web, atau desktop
  - ``` flutter clean ``` untuk menghapus folder build serta file lainnya yang dihasilkan ketika running di device (akan memperkecil size project)
  - Flutter CLI reference: https://docs.flutter.dev/reference/flutter-cli
  
### Packages Management
  - flutter mendukung sharing packages
  - packages dibuat developer lain
  - mempercepat perkembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
  - mendapatkan packages di website https://pub.dev/
  
### Menambahkan packages ke project
  - cari packages di https://pub.dev/
  - copy baris dependencies yang ada dibagian installing
  - buka pubspec.yaml dan paste barisnya dibawah dependencies
  - run ``` flutter pub get ``` di terminal
  - import package di file dart tujuan. example: ``` import 'package: percent_indicator/percent_indicator.dart'; ```
  - package bisa digunakan di project kita. example:
    ```
      new CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: new Text("100%"),
                  progressColor: Colors.green,
                )
    ```
