/*
1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan bahasa pemrograman Dart
2. Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart
*/

void main() {
  rumusKelilingpersegi(4);
  rumusLuaspersegi(5);
  rumusKelilingpersegiPanjang(6.5, 4);
  rumusLuaspersegiPanjang(8, 5.5);
  rumusKelilingLingkaran(7);
  rumusLuaspersegi(6);
}

void rumusKelilingpersegi(double sisi) {
  double keliling = sisi + sisi + sisi + sisi;
  print("Keliling persegi adalah $keliling");
}

void rumusLuaspersegi(double sisi) {
  double luas = sisi * sisi;
  print("Luas persegi adalah $luas");
}

void rumusKelilingpersegiPanjang(double panjang, double lebar) {
  double keliling = panjang + panjang + lebar + lebar;
  print("Keliling persegi panjang adalah $keliling");
}

void rumusLuaspersegiPanjang(double panjang, double lebar) {
  double luas = panjang * lebar;
  print("Luas persegi panjang adalah $luas");
}

void rumusKelilingLingkaran(double jari) {
  double keliling = 2 * 3.14 * jari;
  print("Keliling lingkaran adalah $keliling");
}

void rumusLuasLingkaran(double jari) {
  double luas = 3.14 * jari * jari;
  print("Luas lingkaran adalah $luas");
}
