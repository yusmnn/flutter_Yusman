/*
1. Buatlah sebuah fungsi dengan spesifikasi berikut:
    1. Menerima 2 parameter, yaitu list Data dan pengali
    2. Lakukan perulangan pada list data secara asynchronous
    3. Tiap perulangan, kalikan elemen list data dengan pengali
    4. Return list baru yang berisi hasil proses diatas
*/

void main() async {
  List<int> listData = [1, 2, 3, 4, 5];
  int pengali = 2;
  print("Sebelum Pengalian: $listData");
  List<int> listDataBaru = await pengaliAsync(listData, pengali);
  print("Setelah Pengalian: $listDataBaru");
}

Future<List<int>> pengaliAsync(List<int> listData, int pengali) async {
  List<int> listDataBaru = [];

  for (int elemenList in listData) {
    listDataBaru.add(elemenList * pengali);
    await Future.delayed(Duration(
      seconds: 2,
    ));
    print("$elemenList x $pengali = ${elemenList * pengali}");
  }
  return listDataBaru;
}
