/*
  2. Buatlah sebuah program untuk menghitung frekuensi pada setiap data di dalam sebuah list. Frekuensi merupakan jumlah kemunculan data di dalam list.
    
    Sampel Input: `[js,js,js,golang,python,js,js,golang,rust]`
    Sampel Output: `js: 5, golang: 2, python: 1, rust: 1`
*/

void main() {
  frekuensiData(
    ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'],
  );
}

void frekuensiData(List<String> inputData) {
  List<String> data = inputData;
  Map<String, int> frekuensi = {};

  // mengiterasi setiap item di dalam list data.
  for (int i = 0; i < data.length; i++) {
    String item = data[i];
    if (frekuensi.containsKey(item)) {
      frekuensi[item] = frekuensi[item]! + 1;
    } else {
      frekuensi[item] = 1;
    }
  }

  //  menghitung frekuensi & mengambil semua key di dalam map frequency
  List<String> keys = frekuensi.keys.toList();

  // mengiterasi setiap key di dalam list keys,
  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];
    int jumlah = frekuensi[key]!;
    print('$key: $jumlah');
  }
}
