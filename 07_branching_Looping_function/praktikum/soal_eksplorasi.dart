/*
1. Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk bilangan prima atau bukan.
2. Buatlah sebuah program untuk mencetak tabel perkalian.
*/

import 'dart:io';

void main(List<String> args) {
  cekBilanganPrima(23);
  tabelPerkalian(9);
}

void cekBilanganPrima(int input) {
  int cek = 0;
  for (int i = 2; i <= input; i++) {
    if (input % i == 0) {
      cek++;
    }
  }

  if (cek == 1) {
    print("$input bilangan prima");
  } else {
    print("$input bukan bilangan prima");
  }
}

void tabelPerkalian(int input) {
  for (int i = 1; i <= input; i++) {
    for (int j = 1; j <= input; j++) {
      stdout.write(" ${i * j}");
    }
    stdout.write("\n");
  }
}
