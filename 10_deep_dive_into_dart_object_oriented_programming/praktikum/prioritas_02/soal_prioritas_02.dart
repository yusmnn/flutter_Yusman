/*
1. Buat class dengan spesifikasi Matematika, KelipatanPersekutuanTerkecil, FaktorPersekutuanTerbesar
2. lengkapi code di void main()
*/
//* class Matematika dengan method hasil()
class Matematika {
  int hasil() {
    return 0;
  }
}

//* class KelipatanPersekutuanTerkecil dengan object x dan y
class KelipatanPersekutuanTerkecil implements Matematika {
  KelipatanPersekutuanTerkecil({required this.x, required this.y});
  final int x, y;

  //* method hasil() untuk mecari kelipatan persekutuan terkecil
  @override
  int hasil() {
    int i = x > y ? x : y;
    while (true) {
      if (i % x == 0 && i % y == 0) {
        return i;
      }
      i++;
    }
  }
}

//* class FaktorPersekutuanTerbesar dengan object x dan y
class FaktorPersekutuanTerbesar implements Matematika {
  FaktorPersekutuanTerbesar({required this.x, required this.y});
  final int x, y;

  //* method hasil() untuk mencari faktor persekututan terbesar
  @override
  hasil() {
    int a = x > y ? x : y;
    int b = x > y ? y : x;

    while (b != 0) {
      int r = a % b;
      a = b;
      b = r;
    }
    return a;
  }
}

void main() {
  final KelipatanPersekutuanTerkecil kpk =
      KelipatanPersekutuanTerkecil(x: 15, y: 12);
  final FaktorPersekutuanTerbesar fpb = FaktorPersekutuanTerbesar(x: 18, y: 30);

  print("KPK dari ${kpk.x} dan ${kpk.y} : ${kpk.hasil()}");
  print("FPB dari ${fpb.x} dan ${fpb.y} : ${fpb.hasil()}");
}
