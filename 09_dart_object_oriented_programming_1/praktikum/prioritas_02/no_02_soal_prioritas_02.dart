/*
2. Buatlah sebuah class Course dan Student dengan kriteria sebagai berikut:
    1. Atribut dari Course terdiri dari judul dan deskripsi.
    2. Atribut dari Student terdiri dari nama, kelas dan daftar course yang dimiliki.
    3. Student dapat menambahkan course.
    4. Student dapat menghapus course.
    5. Student dapat melihat semua course yang telah ditambahkan.
*/

class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void printSemuaCourse() {
    print("Nama: $nama");
    print("Kelas: $kelas");
    print("Daftar Course: ");
    for (var course in daftarCourse) {
      print("${course.judul}\t:${course.deskripsi}");
    }
  }
}

void main() {
  // Membuat objek course
  Course pemrogramanWeb =
      Course("Pemrograman Web", "Mata kuliah membahas tentang website.");
  Course pemrogramanMobile =
      Course("Pemrograman Mobile", "Mata kuliah membahas tentang Mobile.");
  Course strukturData =
      Course("Struktur Data", "Mata kuliah membahas tentang Struktur Data.");
  Course algoritma = Course(
      "Algoritma", "Mata kuliah membahas tentang Algoritma Pemrograman.");

  // Membuat objek student
  Student yusman = Student("Yusman", "A5");

  // Menambahkan course ke objek student
  yusman.tambahCourse(pemrogramanWeb);
  yusman.tambahCourse(pemrogramanMobile);
  yusman.tambahCourse(strukturData);
  yusman.tambahCourse(algoritma);

  // Menghapus course pemrogramanMobile
  yusman.hapusCourse(pemrogramanMobile);

  // melihat semua Course
  yusman.printSemuaCourse();
}
