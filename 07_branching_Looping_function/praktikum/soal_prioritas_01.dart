/*
1. Terdapat sebuah nilai:
    1. jika nilai > 70 akan mereturn “Nilai A”
    2. jika nilai > 40 akan mereturn “Nilai B”
    3. jika nilai > 0 akan mereturn “Nilai C”
    4. selain itu return teks kosong

2. tampilkan nilai 1 - 10 pada layar dengan menggunakan perulangan!
*/

import 'dart:io';

void main() {
  tentukanNilai(100);
  tampilkanNilai();
}

// Percabangan (branching)
String tentukanNilai(int nilai) {
  if (nilai > 70) {
    print("Nilai A");
  } else if (nilai > 40) {
    print("Nilai B");
  } else if (nilai > 0) {
    print("Nilai C");
  } else {
    print("Input Salah");
  }
  return " ";
}

// Perulangan(Looping)
void tampilkanNilai() {
  for (int i = 1; i <= 10; i++) {
    stdout.write("$i ");
  }
}
