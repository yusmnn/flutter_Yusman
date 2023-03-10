/*
1. Buat class dengan spesifikasi BangunRuang, Kubus, Balok, berikut:
2. Dari rangkaian class tersebut, buatlah method overriding untuk membedakan tiap proses dalam method antar class.
*/

//*Membuat class BangunRuang dengan object panjang, lebar, tinggi & method volume()
class BangunRuang {
  late num panjang;
  late num lebar;
  late num tinggi;

  num volume() {
    return 0;
  }
}

//* membuat class Kubus inheritance ke class BangunRuang
class Kubus extends BangunRuang {
  late num sisi;

  @override
  num volume() {
    return (sisi * sisi * sisi);
  }
}

//*Membuat class Balok inheritance ke class BangunRuang
class Balok extends BangunRuang {
  @override
  num volume() {
    return (panjang * lebar * tinggi);
  }
}

void main() {
  final Kubus kubus = new Kubus();
  final Balok balok = new Balok();

  kubus.sisi = 5;
  print("Volume Kubus: ${kubus.volume()}");

  balok.panjang = 12;
  balok.lebar = 5.5;
  balok.tinggi = 8.6;
  print("Volume Balok: ${balok.volume()}");
}
