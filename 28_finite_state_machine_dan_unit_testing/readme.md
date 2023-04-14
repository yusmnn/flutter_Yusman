## Resume Materi KMFultter - Finite State Machine & Unit Testing
### Finite State
  - Mesin yang memiliki sejumlah state
  - Tiap state menunjukkan apa yang terjadi sebelumnya
  - Example: Terdapat tiga state yang menunjukkan kejadian di dalam suatu proses
   - IDDLE : saat tidak terjadi proses
   - RUNNING : saat proses sedang berjalan
   - ERROR : saat proses gagal diselesaikan
      ```
        /// Ketika Sukses
          - IDDLE : berubah menjadi RUNNING saat proses berjalan
          - RUNNING : kembali menjadi IDDLE saat proses selesai

        /// Ketika Gagal
          - IDDLE : berubah menjadi RUNNING saat proses perjalan
          - RUNNING : menjadi ERROR saat terjadi kegagalan
          - ERROR : kembali menjadi IDDLE
      ```

  -  Implementasi pada View-Model
  
        ```
          /// menambah enum untuk masing-masing state
          enum ContactViewState {
            none, -> saat IDDLE
            loading, -> saat RUNNING
            error, -> saat ERROR
          }


          class ContactViewModel with ChangeNotifier {

            /// membuat getter dan setter unutk menyimpan state dari widget
            ContactViewState _state = ContactViewState.none;
            ContactViewState get state => _state;

            late List<Contact> _contacts = [];
            List<Contact> get contacts => _contacts;

            changeState(ContactViewState s) {
              _state = s;
              notifyListeners();
            }

            /// Membuat kondisi di proses yang di state agar dapat digunakan
            getAllContacts() async {
              changeState(ContactViewState.loading);

              try {
                final c = await ContactApi().getContacts();
                _contacts = c;
                changeState(ContactViewState.none);
              } catch (error) {
                changeState(ContactViewState.error);
              }
            }
          }
       ```

  - Implementasi pada Widget
      ```
        /// Widget untuk poses sesuai kondisi State
          Widget body(ContactViewModel viewModel) {
            final isLoading = viewModel.state == ContactViewState.loading;
            final isError = viewModel.state == ContactViewState.error;

            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (isError) {
              return Center(
                child: Lottie.network(
                  'https://assets7.lottiefiles.com/packages/lf20_ddxv3rxw.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              );
            }
            return ListContact(
              contactViewModel: viewModel,
            );
          }
      ```
### Unit Test
  - Pengertian Unit test
    - salah satu jenis pengujian pada perangkat lunak
    - pengujian dilakukan pada perangkat lunak
    - unit yang dimaksud umumnya adalah fungsi atau method
  - Tujuan Unit test
    - memastikan fungsi dapat mengolah berbagai jenis input
    - memastikan hasil dari fungsi atau method sudah sesuai
    - menjadi dokumentasi
  - Melakukan Unit test
    - Manual : Unit dijalankan dan dicek hasilnya secara manual
    - Automated : Menulis Script yang dapat dijalankan berkali-kali menggunakan test runner
  - menambahkan ``` test``` pada bagian dev_dependencies di file pubspec.yaml
  - menggunakan perintah ``` flutter test ```
  - mengelompokkan test
    - beberapa test dengan subject yang sama di letakkan berkelompok
    - Dilakukan dengan menggunakan group()
      ```
        void main() {
          /// mengelompokkan test
          group('ContactAPI', () {
            test('Get all Contacts returns Data', () async {
              var contacts = await ContactApi().getContacts();
              expect(
                contacts.isNotEmpty,
                true,
              );
            });

            test('Get all Contacts returns List of Contact', () async {
              var contacts = await ContactApi().getContacts();
              expect(
                contacts.first.runtimeType,
                Contact,
              );
            });
          });
        }
      ```

### Mocking
  - proses yang terikat dengan dengan sistem eksternal dapat mempengaruhi berjalannya ujian
  - Pengaruh tersebut dapat mengganggu proses pengujian
  - dilakukan mocking unutk menghindari masalah-masalah tersebut
  - cara kerja mocking:
    - suatu ibject dibuat tiruannya
    - bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
    - bentuk tiruan menghilangkan ketergantungan pada sistem eksternal
  - menambahkan ``` mockito ``` dan ``` build_runner ``` pada bagian dev_dependencies di file pubspec.yaml
  - membuat file mock dengan menjalankan perintah ``` flutter pub run build_runner build ```
  - melakukan mocking
    ```
    /// import package yang diperlukan
    import 'package:flutter_contactapp_mvvm/models/api/contact_api.dart';
    import 'package:flutter_contactapp_mvvm/models/contact_model.dart';
    import 'package:mockito/mockito.dart';

    import 'package:test/test.dart';
    import 'package:mockito/annotations.dart';
    import 'contact_api_test.mocks.dart';

      /// menggunakan annotation
      @GenerateMocks([ContactApi])

        void main() {
          group('Contact API', () {

            /// membuat object mock
            ContactApi contactApi = MockContactApi();
            
            test('Get all Contacts returns Data', () async {
              when(contactApi.getContacts()).thenAnswer(
                (_) async => <Contact>[
                  Contact(id: 1, name: 'a', phone: '0'),
                ],
              );

              var contacts = await ContactApi().getContacts();
              expect(
                contacts.isNotEmpty,
                true,
              );
            });
          });
        }
    ```