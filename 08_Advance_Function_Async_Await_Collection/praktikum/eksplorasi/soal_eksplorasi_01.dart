/*
1. Buatlah sebuah program untuk menghilangkan nilai atau data yang sama pada sebuah data sehingga output akhirnya adalah sekumpulan nilai atau data yang unik. 
  Sampel Input:`[amuse, tommy kaira, spoon, HKS, litchfield, amuse, HKS]`
  Sampel Output: `[amuse, tommy kaira, spoon, HKS, litchfield]`
    
  Sampel Input:* `[JS Racing, amuse, spoon, spoon, JS Racing, amuse]`
  Sampel Output: `[JS Racing, amuse, spoon]`
*/

void main() {
  List<String> input1 = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  List<String> input2 = [
    'JS Racing',
    'amuse',
    'spoon',
    'spoon',
    'JS Racing',
    'amuse'
  ];

  List<String> output1 = hapusDuplikat(input1);
  List<String> output2 = hapusDuplikat(input2);
  print("\n");
  print("Sebelum: $input1");
  print("Sesudah: $output1");
  print("\n");
  print("Sebelum: $input2");
  print("Sesudah: $output2");
  print("\n");
}

List<String> hapusDuplikat(List<String> input) {
// konversi list ke set lalu menghapus yang duplicate
  Set<String> set = input.toSet();
// konversi kembali set ke list
  return set.toList();
}
