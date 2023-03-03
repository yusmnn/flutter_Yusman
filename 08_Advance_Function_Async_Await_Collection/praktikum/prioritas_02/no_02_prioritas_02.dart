/*
2. Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata.
  Sampel Input: `[7,5,3,5,2,1]`
  Sampel Output:`4`
*/
void main() {
  hitungRataRataNilai([7, 5, 3, 5, 2, 1]);
}

void hitungRataRataNilai(List<int> inputList) {
  double hasilTambah = 0;
  List<int> sekumpulanNilai = inputList;

  for (int i = 0; i < sekumpulanNilai.length; i++) {
    hasilTambah = hasilTambah + sekumpulanNilai[i];
  }

  double nilai = hasilTambah / sekumpulanNilai.length;
  print("Data List: $sekumpulanNilai");
  print("Hasil sebelum dibulatkan: $nilai");
  print("Hasil sesudah dibulatkan: ${nilai.ceil()}");
}
