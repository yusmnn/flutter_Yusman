## Resume Materi KMFlutter – Flutter State Management (Provider)
### Pengertian State
  - data yang dapat dibaca saat pembuatan widget
  - dapat berubah saat widget sedang aktif
  - hanya dimiliki oleh statefulWidget

### Global State
  - state biasa yang daapt digunakan di seluruh widget
  - perlu menggunakan global state agar antara widget dapat memanfaatkan state yang sama dengan mudah.
  - dibuat sebagai property dari class
  - digunakan pada widget saat build
  - Menggunakan method setState()
    ```
      ElevatedButton(
        child: const Text('tambah'),
        onPressed: () {
          setState(() {
            number = number + 1;
          });
        },
      )
    ```
### Provider State Management
  - perlu diinstall dan ditambahkan ke dependencies di pubspec.yaml agar dapat digunakan 
  - membuat state provider
    ```
      import 'package:flutter/material.dart';

      /// mendefinisikan state dalam bentuk class
      class ContactsModel with ChangeNotifier { 
        final List<Contact> _contacts = [];

        List<Contact> get contacts => _contacts;

        void addContact(Contact contact) {
          _contacts.add(contact);
          notifyListeners();
        }

        void removeContact(Contact contact) {
          _contacts.remove(contact);
          notifyListeners();
        }

        void updateContact(Contact contact, Contact newContact) {
          final index = _contacts.indexOf(contact);
          _contacts[index] = newContact;
          notifyListeners();
        }
      }
    ```


  - Mendaftarkan State provider
    ```
      import 'package:flutter/material.dart';
      import '../widgets/routes.dart';
      import 'package:provider/provider.dart';
      import 'providers/list_contacts.dart';

      void main() {
        runApp( 
          /// daftarkan pada runApp dengan MultiProvider
          MultiProvider( 
            providers: [
              ChangeNotifierProvider(
                create: (context) => ContactsModel(),
              ),
            ],
            child: const MyAppRoutes(),
          ),
        );
      }
    ```

  - Menggunakan state dari provider
    ```
      /// build
      final contactsModel = Provider.of<ContactsModel>(context);

      /// return
      ListView.builder(
        itemCount: contactsModel.contacts.length,
         itemBuilder: (BuildContext context, index) {
           final item = contactsModel.contacts[index];
           return Listile(
              title: const Text(item.nama),
              subtitle: const Text(item.numberPhone),
           );
         },
      ); 

    ```
