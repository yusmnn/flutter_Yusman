## Resume Materi KMFultter - Finite State Machine & UI Testing
### Pengertian UI testing
  - Pengujian yang dilakukan pada tampilan suati aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna
  - UI testing di flutter disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis

### Keuntungan UI testing
  - memastikan seluruh widget memberi tampilan yang sesuai
  - memastikan seluruh interaksi dapat diterima dengan baik
  - menjadi ketentuan yang harus diikuti saat diperlukan perubahan widget

### Melakukan UI testing
  - menginstall package ``` flutter_test ```
  - penulisan script testing dilakukan pada folder ``` test ``` dengan nama file berakhiran ``` _test.dart ``` contoh ``` home_page_test.dart ``` 
  - tiap file berisi fungsi main() yang didalamnya dapat dituliskan script testing
  - tiap skenario pengujian disebut test case
  - perintah ``` flutter test ``` akan menjalankan seluruh file test yang dibuat 
    ```
      void main() {

        const String headerList = 'List Contacts';

          /// test case diawali dengan testWidgets lalu diberi judul
          testWidgets('Memiliki title “List Contacts”', (WidgetTester tester) async {

            /// simulasi proses mengaktifkan halaman FormPage
            await tester.pumpWidget(const MaterialApp(
              home: FormPage(),
            ));

            /// memeriksa apakah di halaman tersebut terdapat text dari variable headerList
            expect(find.text(headerList), findsOneWidget);
          });
      }
    ```