## Resume Materi – Dart Object Oriented Programming 1
### Perkenalan Object Oriented Programming:
  - biasa juga disebut OOP/Pemrograman Berorientasi Objek
  - Program disusun dalam bentuk abstraksi object
  - Data dan proses diletakkan pada abstraksi tersebut
  - konsep OOP mudah di troubleshoot dan mudah digunakan ulang
  - Konsep OOP juga banyak digunakan di bahasa pemrograman lainnya
 
### Komponen OOP:
  - class
    - Abstraksi dari sebuah benda (object)
    - Memiliki ciri-ciri yang disebut property
    - memiliki sifat dan kemampuan yang disebut method
    - membuat class:
      ```
      class Hewan{
        // property
        // method
      }
      ```
   - Object:
     - bentuk sebenarnya dari class
     - disebut juga instance of class
     - Diperlakukan seeprti data
     - membuat object:
       ```
       void main() {
         var h1 = Hewan();
         var h2 = Hewan();
       }
       ```
  - Property:
    - ciri-ciri suatu class
    - hal-hal yang dimiliki suatu class
    - Memiliki sifat seperti variable
    - membuat property: seperti variable tapi terletak di dalam class
      ```
       class Hewan{
          var mata = 0;
          var kaki = 0;
       }
      ```
    - akses property:
       ```
        void main() {
         var h1 = Hewan();
         print(h1.kaki);
        }     
       ```
  - Method:
    - sifat suatu class
    - aktifitas yang dapat dikerjakan suatu class
    - memiliki sifat seperti fungsi
    - membuat method: seperti fungsi tapi terletak di dalam class
      ```
       class Hewan{
          void bersuara(){
            print("Suiiii");
          }
       }
      ```
    - Menjalankan method: seperti menggunakan fungsi tapi melalui object
       ```
        void main() {
         var h1 = Hewan();
         h1.bersuara();
        }     
       ```