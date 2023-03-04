/*
1. Buatlah sebuah class hewan dengan property berat(mneyimpan data berat badan hewan).
2. Selanjutnya pada class Mobil, tambahkan method totalMuatan untuk menghitung total muatan yang diangkut oleh mobil tersebut.
*/

/*
1. Buatlah sebuah class hewan dengan property berat(mneyimpan data berat badan hewan).
2. Selanjutnya pada class Mobil, tambahkan method totalMuatan untuk menghitung total muatan yang diangkut oleh mobil tersebut.
*/
/*
1. Buatlah sebuah class hewan dengan property berat(mneyimpan data berat badan hewan).
2. Selanjutnya pada class Mobil, tambahkan method totalMuatan untuk menghitung total muatan yang diangkut oleh mobil tersebut.
*/

void main() {
  var mobil = Mobil(100);
  Hewan kuraKura = Hewan(20);
  Hewan kudanil = Hewan(80);
  Hewan kapibara = Hewan(40);
  Hewan kangguru = Hewan(40);

  // untuk menambah hewan ke muatan mobil
  mobil.tambahMuatan(kuraKura);
  mobil.tambahMuatan(kudanil);
  mobil.tambahMuatan(kapibara);
  mobil.tambahMuatan(kangguru);

  // untuk menampilkan berat hewan list muatan mobil
  if (mobil.muatan.isEmpty) {
    print("Belum ada muatan dalam mobil");
  } else {
    print("Berat muatan mobil:");
    for (Hewan hewan in mobil.muatan) {
      print("> ${hewan.berat} kg");
    }
  }
}

class Hewan {
  double berat;
  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  double totalMuatan = 0;
  Mobil(this.kapasitas);

  List<Hewan> muatan = [];

  // method untuk menambah muatan sesuai kapasitas mobil
  void tambahMuatan(Hewan hewan) {
    for (Hewan beratMuatan in muatan) totalMuatan = beratMuatan.berat;
    if (totalMuatan + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print("Hewan dengan berat ${hewan.berat} ditambahkan ke dalam muatan.");
    } else {
      print(
          "Hewan gagal ditambahkan. Berat hewan ${hewan.berat} melebihi kapasitas muatan");
    }
  }
}
