## Resume Materi KMFlutter – MVVM Architecture

### Pengertian MVVM Architecture
  - MVVM singkatan dari Model-View ViewModel
  - Memisahkan Logic dengan tampilan (view) ke dalam ViewModel

### Keuntungan menggunakan MVVM
  - Reusability: Jika ada beberapa tampilan yang memiliki alur logic yang sama, maka dapat menggunakan ViewModel yang sama
  - Maintainability: Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
  - Testability: Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

### Melakukan MVVM
  - Struktur direktori
    - Model memiliki dua bagian yaitu bentuk data yang akan digunakan dan sumber dari data tersebut.
    - Tiap Screen diletakkan dalam sebuah direktori yang dalamnya terdapat view dan viewModel
  - Model: 
    - bentuk data yang akan digunakan dibuat dalam bentuk class
    - data-data yang dimuat, diletakkan pada property
      ```
        class Contact {
          Contact({
              required this.id,
              required this.name,
              required this.phone,
            });

            final int id;
            final String name;
            final String phone;
        }
      ```
    - Model API
      ```
        class ContactApi {
          static Future<List<Contact>> getContacts() async {
            try {
              final response = await Dio().get(
                  'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

              List<Contact> contacts = (response.data as List)
                  .map(
                    (e) => Contact(
                      id: e['id'],
                      name: e['name'],
                      phone: e['phone'],
                    ),
                  )
                  .toList();

              return contacts;
            } catch (error) {
              debugPrint('Terjadi kesalahan: $error');
              rethrow;
            }
          }
        }
  
      ```
  - ViewModel
    - Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
    - Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

      ```
        class ContactViewModel with ChangeNotifier {
            late List<Contact> _contacts = [];
            List<Contact> get contacts => _contacts;

            getAllContacts() async {
              final dataContact = await ContactApi.getContacts();
              _contacts = dataContact;
              notifyListeners();
            }
          }
      ```
  - mendaftarkan ViewModel
    - menggunakan MultiProvider agar dapat menggunakan banyak ViewModel
    - MaterialApp sebagai child utama

      ```
        runApp(
          MultiProvider(
            providers = [
              ChangeNotifierProvider(
                create: (_) => ContactViewModel(),
              ),
            ],
            child = MaterialApp(
              title: 'Flutter MVVM',
              debugShowCheckedModeBanner: false,
            ),
          ),
        );

      ```

  - View:  Menggunakan StatefulWidget
    ```
        @override
        void didChangeDependencies() {
          super.didChangeDependencies();
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
          });
        }
    ```
  - Menampilkan data di View
    ```
        @override
        Widget build(BuildContext context) {
          final contactViewModel = Provider.of<ContactViewModel>(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Contact'),
              centerTitle: true,
            ),
            drawer: const RouterWidget(),
            body: Center(
              child: contactViewModel.contacts.isEmpty
                  ? const CircularProgressIndicator()
                  : ListContact(
                      contactViewModel: contactViewModel,
                    ),
            ),
          );
        }

     /// Widget ListContact
      class ListContact extends StatelessWidget {
        const ListContact({
          super.key,
          required this.contactViewModel,
        });

        final ContactViewModel contactViewModel;

        @override
        Widget build(BuildContext context) {
          return ListView.builder(
            itemCount: contactViewModel.contacts.length,
            itemBuilder: (context, index) {
              final contact = contactViewModel.contacts[index];
              return Consumer<ContactViewModel>(
                builder: (context, contactViewModel, child) {
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                  );
                },
              );
            },
          );
        }
      }
    ```
