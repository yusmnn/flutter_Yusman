## Resume Materi KMFlutter – Assets
### Assets
  - file yang dibundled dan di deploy bersamaan dengan aplikasi
  - tipe assets:
    - static data (JSON files)
    - icons
    - images
    - font file (ttf)
  - Menentukan Asset menggunakan pubspec.yaml
  - pubspec.yaml terletak pada root project, untuk mengidentifikasi assets yang dibutuhkan
  - gunakan karakter '/' untuk memasukkan semua asset dibawah satu direktori
  ```
    assets:
      - assets/images/
      - assets/icons/
  ```

### Images
- Flutter mendukung format gambar seperti JPEG, WebP,GIF, Animated Web/GIF, PNG, Bmp, dan WBMP
- untuk menggunakan asset image bisa menggunakan widget Image() dan Image.asset()

```
//cara 1
Image(
  image: AssetImage('assets/img_1.png'),
)
//cara 2
Image.asset('assets/img_1.png'),
```
### Fonts
- penggunaan font dapat membuat tampilan UI aplikasi menarik
- penerapan font menggunakan custom font atau dari package
- font dapat di download di https://fonts.google.com/
  - kemudian import file .ttf
  - daftarkan font di pubspec.yaml
- mengatur font default dapat dilakukan di bagian thema
  ``` theme: ThemeData(fontFamily: 'Rowdies'),```
- font dari package google_fonts
  ```
  Text(
    'Hello World',
    style: GoogleFonts.rowdies(fontSize: 30),
  )
  ```
