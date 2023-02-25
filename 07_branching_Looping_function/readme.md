## Resume Materi – Branching, Looping, Function
- Pengambilan keputusan adalah menentukan alur alur program pada kondisi tertentu. Biasanya menggunakan:
  - If: proses dijalankan ketika nilai bool true.
  - else if: sama seperti if, digunakan jika ingin menambah beberapa opsi.
  - else: dijalankan ketika if dan else-if bernilai false.
- perulangan: menjalankan proses berulang kali.
  - for: digunakan ketika sudah mengetahui bearapa kali perulangan ingin dilakukan. Memerlukan nilai awal, nilai bool, dan pengubah nilai.
  - while: digunakan ketika tidak mengetahui berapa kali perulangan. memerlukan nilai bool.
  - do-while: proses dijalankan terlebih dahulu dan jika nilai bool true maka akan dlanjutkan dan akan terus dilanjutkan sampai nilai bool false.
  - break: menghentikan seluruh proses perulangan.
  - continue: menghentikan satu kali proses perulangan.
- fungsi: kumpulan block kode yang dapat digunakan ulang.
  - membuat fungsi: menggunakan cemalCase, dan tanda kurung kurawal.
    - void namaFungsi(){
      // code
    }
  - memanggil fungsi: menuliskan nama fungsi.
    - namaFungsi();
  - fungsi dengan parameter: mengirim data saat menjalankan fungsi.
    - tipeData namaFungsi(tipeData namaParameter){
      // code
    }
  - fungsi dengan return: memberi nilai pada fungsi saat dipanggil.
    - tipeData namaFungsi(tipeData namaParameter){
      // code
      return value;
    }