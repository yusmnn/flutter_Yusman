## Resume Materi – Deep Dive Into Dart Object Oriented Programming
### Cunstructor
  - Method dijalankan saat pembuatan objec
  - dapat menerima paramete
  - tidak memiliki retur
  - nama sama dengan nama clas
  - memberi nama constructor: tambahkan method menggunakan nama sama dengan clas
      ```
        class Hewan {
         var mata;
         var kaki;
         
         Hewan(){ //constructor
          mata = 0;
          kaki = 0;
         }
        }     
      ```
### Inheritance
  - membuat class baru dengan memanfaatkan class yang sudah ada
  - bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru
  - melakukan inheritance: menambah extends saat pembuatan class baru
      ```
        class Hewan {
         var mata;
         var kaki;
         
         Hewan(){
          mata = 0;
          kaki = 0;
         }
        }
        class kambing extends Hewan { //inheritance
          Kambing() {
            mata = 2;
            kaki = 4;
          }
        }   
      ```
    - penggunaan class: proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya:
      ```
      void main() {
        var k1 = Kambing();
        print(k1.mata);
        
        var h2 = Hewan();
        print(h1.mata);

      }
      ```

### Method Overriding
  - menulis ulang method yang ada pada super-class
  - Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda
  - melakukan overriding:
    ```
      class Hewan {
        //method sudah ada pada class induk
        reproduksi() { 
          print("tidak diketahui");
        }

        bernapas() {
          print("tidak diketahui");
        }
      }

      //dilakukan pada class yang melakukan inheritance (pewarisan)
      class Kambing extends Hewan {
        @override //ditambahkan tanda @override di baris sebelum method dibuat
        reproduksi() { //method ditulis ulang seperti membuat method baru pada class anak
          print("melahirkan");
        }

        @override
        bernapas() {
          print("Paru-Paru");
        }
      }
      ```
    - penggunaan class: proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya:
      ```
      void main() {
        var k1 = Kambing();
        k1.reproduksi();
        k1.bernapas();
        
        var h1 = Hewan();
        h1.reproduksi();
        h1.bernapas(); 
      }
      ```
### Interface
  - Interface berupa class
  - menunjukkan method apa saja yang ada pada class
  - seluruh menthod wajib di @override
  - digunakan dengan method implements
  - menggunakan intarface
    ```
      //Sekilas mirip dengan Inheritance 
      class Hewan {
        reproduksi() { 
          print("tidak diketahui");
        }

        bernapas() {
          print("tidak diketahui");
        }
      }

      //pada class yang melakukan implements wajib melakukan override semua method yang ada pada class induk.
      class Kambing implements Hewan {
        @override
        reproduksi() {
          print("melahirkan");
        }

        @override
        bernapas() {
          print("Paru-Paru");
        }
      }
      ```
    - penggunaan class: proses membuat object dari class yang terjadi inheritance seperti pembuatan object pada umumnya:
      ```
      void main() {
        var k1 = Kambing();
        k1.reproduksi();
        k1.bernapas();
        
        var h1 = Hewan();
        h1.reproduksi();
        h1.bernapas(); 
      }
      ```
### Abstract Class
  - berupa class abstrak
  - menunjukkan method apa saja yang ada pada suatu class
  - digunakan dengan menggunakan extends
  - tidak dapat dibuat object
  - tidak semua method harus di @override
    ```
      abstract class Hewan {
        reproduksi() { 
          print("tidak diketahui");
        }

        bernapas() {
          print("tidak diketahui");
        }
      }

      class Kambing extends Hewan {
        @override
        reproduksi() {
          print("melahirkan");
        }
      }
    ```
    - penggunaan class:
      ```
      void main() {
        var k1 = Kambing();
        k1.reproduksi();
        k1.bernapas();
      }
### Polymorphism
  - kemampuan data berubah menjadi bentuk lain
  - tipe data yang dapat digunakan adalah super class
  - dapat dilakukan pada class dengan extends atau implements
    ```
    // Object dari class "Kambing" dengan tipe data class "Hewan"
      void main() {
        Hewan k1 = Kambing();
        k1.reproduksi();
        k1.bernapas();
      }
    ```
### Generics
  - dapat digunakan pada class atau fungsi
  - memberi kemampuan agar dapat  menerima data dengan tipe data yang berbeda
  - tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi
    #### Membuat class dengan Generics
      ```
        class Hadiah <T> { //Class "hadiah" dapat dimasukkan data dengan tipe T
          var isi;

          Hadiah(T i) { // Tipe T dapat digunakan di seluruh class "Hadiah"
            isi = i;
          }
        }
      ```
    #### Menggunakan class dengan Generics
      ```
        void main() {
          var h1 = Hadiah<String>("Mobil"); //Setelah nama class, menjadi tempat tipe data yang diinginkan
          print(h1.isi);

          var h2 = Hadiah<Int>(10);
          print(h2.isi);
        }
      ```
    #### Membuat fungsi dengan Generics
      ```
        void cekTipe<T>(T data) { //Setelah nama fungsi, menjadi tempat variable Generics
          print("data.runtimeType");
        }
      ```
    #### Menggunakan fungsi dengan Generics
      ```
        void main() {
          cekTipe<String>("Satu"); //Setelah nama fungsi, menjadi tempat tipe data yang diinginkan
          cekTipe<int>(1);
        }
      ```
