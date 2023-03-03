/*
1. Buatlah sebuah list dengan spesifikasi berikut:
    1. Tiap elemen wajib berupa list juga
    2. tiap element wajib terdapat 2 data(sub-elemen)
    3. Buatlah sebuah map dengan menggunakan list tersebut
*/

void main() {
  List<List<int>> listAngka = [
    [1, 1],
    [22, 12],
    [33, 13],
    [44, 14],
    [55, 15],
  ];

  Map<int, int> mapAngka = {};
  listAngka.forEach((list) => mapAngka[list[0]] = list[0]);

  print(listAngka);
  print(mapAngka);
}
