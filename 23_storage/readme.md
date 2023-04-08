## Resume Materi KMFlutter – Storage
### Penyimpanan Lokal
  - Diperlukan untuk efisiensi penggunaan data internet
  - Tersimpan di penyimpanan lokal user

### Shared Preferences
  - menyimpan data yang sederhana
  - penyimpanan dengan format key-value
  - menyimpan tipe data dasar seperti teks, angka, dan boolean
  - contoh penggunaannya adalah ketika menyimpan data login dan riwayat pencarian
  - untuk menggunakan tambahakan package ``` shared_preference ``` di pubspec.yaml
  - Example bagian ``` login_page: ```
      ```
        /// membuat property untuk form
          final TextEditingController _userNameController = TextEditingController();
          final TextEditingController _passwordController = TextEditingController();

        /// membuat method dispose() untuk menghindari kebocoran memory
          @override
          void dispose() {
            _userNameController.dispose();
            _passwordController.dispose();
            super.dispose();
          }

        /// membuat variable baru unutk menyimpan SharedPreference dan nilai bool newUser
          late SharedPreferences loginData;
          late bool newUser;

        /// membuat method checkLogin()
          void checkLogin() async {
            loginData = await SharedPreferences.getInstance();
            newUser = (loginData.getBool('login') ?? true);
            if (newUser == false) {
              Navigator.of(context).pushReplacement(_createContactFormPage());
            }
          }

        /// panggil checkLogin() di initState()
            @override
            void initState() {
              super.initState();
              checkLogin();
            }

        /// membuat variable baru untuk menampung input dari user di Button
          onTap: () {
            final isValidForm = _formLoginKey.currentState!.validate();
            String userName = _userNameController.text;

            if (isValidForm) {
              loginData.setBool('login', false);
              loginData.setString('username', userName);
              Navigator.of(context)
                  .pushReplacement(_createContactFormPage());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red[400],
                  content: const Text('Mohon mengisi form dengan benar'),
                ),
              );
            }
          },
        ```

  - Example bagian ``` home_page: ```
      ```
      /// membuat variable baru untuk menyimpan SharedPreference dan userName
        late SharedPreferences loginData;
        late String userName = '';

      /// membuat method initialize()
        void initialize() async {
          loginData = await SharedPreferences.getInstance();
          setState(() {
            userName = (loginData.getString('username').toString());
          });
        }

      /// panggil initilize() di initState()
        void initState() {
          super.initState();
          initialize();
        }

      /// menambahkan method setBool dan remove di Button
        onTap: () {
          loginData.setBool('login', true);
          loginData.remove('username');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
      ```
### Local Database (SQLite)
- Menyimpan dan meminta data dalam jumlah besar pada local device
- bersifat privat
- Menggunakan SQlite database melalui package sqflite
- SQLite adalah database opensource yang mendukung insert, read, update, dan remove data
- Contoh penggunaan SQlite pada aplikasi task_management https://bit.ly/3J8dinV
