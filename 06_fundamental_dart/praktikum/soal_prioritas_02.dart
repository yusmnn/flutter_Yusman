/*
1. Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.
2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.
*/

void main() {
  sambungVariable("Nama", "Saya", "Yusman");
  rumusVolumeTabung(8, 12);
}

void sambungVariable(String a, String b, String c) {
  print("$a $b $c");
}

void rumusVolumeTabung(double jari, double tinggi) {
  double volume = 3.14 * jari * jari * tinggi;
  print("Volume tabung adalah $volume");
}
