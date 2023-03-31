## Resume Materi KMFlutter – Flutter State Management (BLoC)

### Declarative UI
  - flutter memiliki sifat declarative yang artinya flutter membangun UI-nya pada screen untuk mencerminkan keadaan state saat ini.
  - state adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori
  - flutter akan membangun ulang UI-nya ketika ada state atau data yang berubah

### Ephemeral State
  - Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya, contohnya:
    - PageView
    - BottomNavigationBar
    - SwitchButton
  - tidak perlu state management kompleks
  - hanya membutuhkan statefulWidget dengan menggunakan fungsi setState()

### App State
  - digunakan ketika bagian lain suatu aplikasi membutuhkan akses ke data state widget:
    - login info
    - pengaturan preferensi pengguna
    - informasi untuk user yang ditampikan di screen berbeda
### Pengertian Bloc
  - BloC (Business Logic Component)
  - Memisahkan antara business logic dengan UI
  - BloC dipilih karena powerfull, simple, Testable
### Cara kerja BloC
  - Menerima event sebagai input
  - Dianalisa dan dikelola di dalam BloC
  - menghasilkan state sebaagai output
    ```
      event                output
      input ---> Bloc ---> State
       
    ```
### Stream
  - rangkaian proses secara asynchronous
  - actor utama dibalic BloC
