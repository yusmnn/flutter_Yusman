/*
1. Buatlah sebuah class Calculator dengan kriteria sebagai berikut:
    1. Terdapat method untuk melakukan penjumlahan dua bilangan.
    2. Terdapat method untuk melakukan pengurangan dua bilangan.
    3. Terdapat method untuk melakukan perkalian dua bilangan.
    4. Terdapat method untuk melakukan pembagian dua bilangan.
*/

import 'dart:io';

class Calculator {
  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Tidak bisa membagi Nol");
    }
    return a / b;
  }
}

int getOption() {
  print("\n### Menu: ");
  print("1. Penjumlahan");
  print("2. Pengurangan");
  print("3. Pengalian");
  print("4. Pembagian");
  print("5. Quit");
  stdout.write("Masukkan Pilihan 1 - 5 : ");
  int pilih = int.parse(stdin.readLineSync()!);

  return pilih;
}

void main() {
  Calculator calculator = Calculator();
  int pilih = 0;

  do {
    int pilih = getOption();

    switch (pilih) {
      case 1:
        stdout.write("Masukkan Bilangan Pertama:");
        var angka1 = double.parse(stdin.readLineSync()!);

        stdout.write("Masukkan Bilangan Kedua:");
        var angka2 = double.parse(stdin.readLineSync()!);
        var hasil = calculator.tambah(angka1, angka2);
        print("hasil: $hasil");
        break;
      case 2:
        stdout.write("Masukkan Bilangan Pertama:");
        var angka1 = double.parse(stdin.readLineSync()!);

        stdout.write("Masukkan Bilangan Kedua:");
        var angka2 = double.parse(stdin.readLineSync()!);
        var hasil = calculator.kurang(angka1, angka2);
        print("hasil: $hasil");
        break;
      case 3:
        stdout.write("Masukkan Bilangan Pertama:");
        var angka1 = double.parse(stdin.readLineSync()!);

        stdout.write("Masukkan Bilangan Kedua:");
        var angka2 = double.parse(stdin.readLineSync()!);
        var hasil = calculator.kali(angka1, angka2);
        print("hasil: $hasil");

        break;
      case 4:
        try {
          stdout.write("Masukkan Bilangan Pertama:");
          var angka1 = double.parse(stdin.readLineSync()!);

          stdout.write("Masukkan Bilangan Kedua:");
          var angka2 = double.parse(stdin.readLineSync()!);
          var hasil = calculator.bagi(angka1, angka2);
          print("hasil: $hasil");
        } on ArgumentError catch (e) {
          print("Error: ${e.message}");
        }
        break;
      case 5:
        exit(0);
      default:
        print("Kesalahan Input");
    }
  } while (pilih <= 5 || pilih >= 1);
}
