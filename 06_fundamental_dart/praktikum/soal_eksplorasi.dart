/*
1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan. Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau susunan yang sama persis.  
    **Sampel Input:** `kasur rusak 
    **Sampel Output:** `palindrom`
    
    **Sampel Input:** `mobil balap`
    **Sampel Output:** `bukan palindrom` 

2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.
*/

void main() {
  cekpalindrom("kasur rusak");
  faktorBilangan(24);
}

void cekpalindrom(String kata) {
  if (kata == kata.split("").reversed.join("")) {
    print("palindrom");
  } else {
    print("Bukan palindrom");
  }
}

void faktorBilangan(int bilangan) {
  for (int i = 1; i < bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
