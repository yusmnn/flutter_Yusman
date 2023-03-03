## Resume Materi – Advance Function – Async-Await – Collection
### Fungsi (Lanjutan):
  - Anonymous function:
    - tidak memiliki nama fungsi sebagai Data.
      ```
        var hello = () {
        // code yang dijalankan ketika fungsi dipanggil.
          print("hello);
        }
      ```
  - Arrow function:
    - dapat memiliki nama atau tidak
    - Berisi 1 data (dari proses maupun data statis).
    - Nilai return fungsi diambil dari data tersebut.
      ```
        var hello = () => print("Hello");
      ```
### Async -Await:
  - Menjalankan beberapa proses tanpa perlu menunggu.
  - proses di tulis dalam bentuk fungsi.
  - Await akan menunggu hingga proses async selesai.
    ```
    Future<void> hello () async {
              await Future.delayed(Duration(seconds: 1), () {
        print("Hello");
      });
    }
    ```
   - fungsi main() menjadi async karena  menggunakan await
      ```
        void main() async {
          await hello();
        }
      ```
### Tipe data Future:
  - Data yang dapat ditunggu
  - Membawa data return dari fungsi async.
  - example:
    ```
    Future<String> hello () {
      await Future.delayed(Duration(seconds: 1), () {
        return "Hello";
      });
    }
    ```
   - Menghasilkan Future yang didalamnya terdapat string
      ```
        void main() {
          var data = await hello();
          print(data);
        }
      ```
### Collection:
  - kumpulan data pada satu tempat.
    #### List:
    - Menyimpan data (elemen) secara berbaris.
    - tiap data memimliki index.
      ```
        void main() {
          var scores - [60,70,80, 90,100];
          scores.add(10); // menambah data
          print(sores[0]); // ambil data berdasarkan index
        }
      ```
    #### Map:
    - Menyimpan data secara key-value.
    - Key berguna selayaknya index di list.
      ```
        [key1 , value1]
        [key2 , value2]
        [key3 , value3]
      ```
    - example:
      ```
        void main() {
          var student = {}; // buat map kosong
          Student["name] = "Yusman"; // menambah data
          student["age] = "20";

          print(student); // print map

          print(student["name"]); ambil data berdasarkan key
          print(student["age"]);
        }
      ```