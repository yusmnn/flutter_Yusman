## Resume Materi KMFlutter – Introduction REST API
### REST API
  - Representational State Transfer Application Programming Interface
  - Arsitektural yang meisahkan tampilan dengan proses bisnis
  - Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

### HTTP
  - Protokol yang digunakan unutk berkirim data pada internet, biasanya data tersebut berbentuk media web
  - Client mengirim request lalu server mengelola dan membalas dengan memberi response
  - Struktur request:
    - URL: alamat halaman yang akan diakses
    - Method:
      - GET:  mengambil (membaca) data dari sumber daya yang ditentukan oleh URL
      - POST: membuat (menyimpan) data baru ke sumber daya yang ditentukan oleh URL
      - PUT: mengganti (mengupdate) data pada sumber daya yang ditentukan oleh URL atau membuat sumber daya baru jika belum ada
      - DELETE:  menghapus data pada sumber daya yang ditentukan oleh URL
      - etc
    - Header: informasi tambahan terkait request yang dikirimkan
    - Body: Data yang disertakan bersama request
  - struktur response:
    - kode yang mewakili keseluruhan response, baik sukses maupun gagal
    - Header: informasi tambahan terkait response yang dikirimkan
    - Body: Data yang disertakan bersama response. 
### Dio
  - Sebagai HTTP client
  - Dimanfaatkan untuk REST API
  - Untuk menggunakan Dio harus ditambahkan di pubspec.yaml
    ```
      import 'package:dio/dio.dart';
      import 'package:flutter/material.dart';

      void main() {
        Dio()
            .get(
                'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
            .then((response) {
          debugPrint(response.data.toString());
        });
      }

      /// Output di debug Console
        [
          {
            "id": 1,
            "name": "Alex Under",
            "phone": "0821867326725"
          },
          {
            "id": 2,
            "name": "John Thor",
            "phone": "0857676565688"
          },
          {
            "id": 3,
            "name": "Isa Bell",
            "phone": "0898736763736"
          }
        ]
    ```
  - Penggunaan Method GET()
    ```
      import "package: dio/dio.dart";

      final Dio dio = Dio();

      final Response response = await dio.get(
        'https://reqres.in/api/users'
      );
    ```
  - Penggunaan Method POST()
    ```
      import "package: dio/dio.dart";

      final Dio dio = Dio();

      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'name': 'yusmnn',
          'job': 'leader',
        },
      );
    ```
  - Penggunaan Method PUT()
    ```
      import "package: dio/dio.dart";

      final Dio dio = Dio();

      final Response response = await dio.put(
        'https://reqres.in/api/users/2', // id user yang ditambahkan ke end point
        data: {
          'name': 'yusmnn',
          'job': 'leader',
        },
      );
    ```
  - Penggunaan Method DELETE()
    ```
      import "package: dio/dio.dart";

      final Dio dio = Dio();

      final Response response = await dio.delete(
        'https://reqres.in/api/users/2',
      );
    ```
### JSON
  - Singkatan JavaScript Object Notation
  - JSON merupakan cara penulisan data
  - Umum digunakan pada REST API
  - serialisasi JSON: mengubah struktur data ke bentuk JSON

      ``` 
          /// Map/List ---> Serialisasi ---> JSON

          import "dart: convert";
          import 'package:flutter/material.dart';

          void main() {
            var dataMap = {...};
            var dataJSON = jsonEncode(dataMap); /// menggunakan fungsi jsonEncode dari package dart:convert
            debugPrint(dataJSON);
          }

         /// Output di debug Console
          {
            "name" : "Jhon Thor",
            "Phone" : "0398456903457",
          }
      ```

   - Deserialisasi JSON: mengubah bentuk JSON ke struktur data

      ``` 
          /// Map/List ---> Deserialisasi ---> JSON

          import "dart: convert";
          import 'package:flutter/material.dart';

          void main() {
            var dataMap = {...};
            var dataJSON = jsonDecode(dataMap); /// menggunakan fungsi jsonDecode dari package dart:convert
            debugPrint(dataJSON);
          }

         /// Output di debug Console
          {
            name : Jhon Thor,
            Phone : 0398456903457,
          }

      ```
  
