/*
1. Buatlah sebuah piramid bintang
2. Buatlah sebuah jam pasir seperti pada gambar dibawah ini
3. Tampilkan faktorial dari nilai nilai dibawah in:
    1. 10
    2. 40
    3. 50
4. Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. kemudian function lingkaran tersebut dijalankan pada function main!
*/

import 'dart:io';

void main() {
  piramidBintang(6);
  stdout.write("\n");
  jamPasir(6);
  stdout.write("\n");
  faktorialBilangan(10);
  stdout.write("\n");
  rumusLuasLingkaran(14);
}

/// Function piramid bintang
void piramidBintang(int n) {
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n - i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    stdout.write("\n");
  }
}

/// function pola jam pasir
void jamPasir(int input) {
  // pola bagian atas
  for (int a = input; a >= 1; --a) {
    for (int spasi = 1; spasi <= input - a; spasi++) {
      stdout.write(" ");
    }
    for (int b = a; b <= 2 * a - 1; b++) {
      stdout.write("0");
    }
    for (int b = 0; b < a - 1; b++) {
      stdout.write("0");
    }
    stdout.write("\n");
  }
  // pola bagian bawah
  for (int c = 2; c <= input; c++) {
    for (int spasi = 1; spasi <= input - c; spasi++) {
      stdout.write(" ");
    }
    for (int d = 1; d <= 2 * c - 1; d++) {
      stdout.write("0");
    }
    stdout.write("\n");
  }
}

/// function factorial
void faktorialBilangan(int angka) {
  var faktorial = BigInt.from(angka);
  for (int i = angka - 1; i >= 1; i--) {
    faktorial *= BigInt.from(i);
  }
  print("$angka! = $faktorial");
}

/// function rumus luas Lingkaran -> L = phi x r x r
void rumusLuasLingkaran(double jari) {
  double luas = (3.14 * (jari * jari));
  print("Luas lingkaran adalah $luas");
}
