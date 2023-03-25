## Resume Materi KMFlutter – Flutter Navigation
### Penjelasan Navigation
  - berpindah dari halaman satu ke halaman lain
### Navigation Dasar
  - perpindahan halaman menggunakan Navigator.push()
    ```
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
        },
        child: Text('About'),
      ),

    ```
  - Mengirimkan data ke halaman baru
    ```
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutPage(parameter: 'Horeee')),
      );

    ```
  - Dibagian page baru (class baru)
    ```
      class AboutPage extends StatelessWidget {
        final String parameter; // -> property yang akan menerima parameter

        const AboutPage({Key? key, required this.parameter}) : super(key: key);

        @override
        Widget build(BuildContext context) {
          return ....
        }
      }

    ```
  - kembali ke halaman sebelumnya menggunakan Navigator.pop()
    ```
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go Back'),
      );
    ```
  - Mengirimkan data ke halaman sebelumnya
    ```
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context, 'result data');
        },
        child: Text('Go Back'),
      );

    ```
  
### Navigation Dengan Name Routes
- tiap halaman memiliki alamat yang disebut dengan route
- perpindahan halaman menggunakan Navigator.pushNamed()
- kembali ke halaman selanjutnya Navigator.pop()
- mendaftarkan route
  ```
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
        
          initialRoute: '/', // -> menentukan halaman yang pertama kali dibuka

          // daftar halaman yang dapat dibuka
          routes: {
            '/': (context) => HomePage(),
            '/about': (context) => AboutPage(),
            '/setting': (context) => SettingsPage(),
          },
        );
      }
    }

  ```
- perpindahan halaman
  ```
    ElevatedButton(
      child: Text('Go to about'),
      onPressed: () {
        Navigator.pushNamed(context, '/about');
      },
    ),
  ```
- mengirim data ke halaman baru menggunakan arguments saat melakukan pushNamed
  ```
    ElevatedButton(
      child: Text('Go to about'),
      onPressed: () {
        Navigator.of(context).pushNamed(
          '/about',
          arguments: 'hero',
        );
      },
    ),
  ```
- Dibagian page baru (class baru)
  ```
    class AboutScreen extends StatelessWidget {
      
      //...

      @override
      Widget build(BuildContext context) {

        // mengambil parameter yang dikirim melalui arguments
        final parameter MOdalRoute.of(context)!settings.arguments as String;

        return.../
      }
    }
  ```