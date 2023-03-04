/*
  1. Sebuah toko buku ingin mengembangkan sebuah sistem untuk mengelola data buku. Data buku tersebut terdiri dari ID, judul, penerbit, harga dan kategori. Sistem tersebut dapat menambahkan, mendapatkan semua data buku dan menghapus data buku. Buatlah program berdasarkan skenario tersebut.
*/

class Book {
  Book(
      {required this.id,
      required this.judul,
      required this.penerbit,
      required this.harga,
      required this.kategori});

  double harga;
  String id, kategori, penerbit, judul;

  @override
  String toString() {
    return "ID: $id, judul: $judul, penerbit: $penerbit, harga: $harga, Category: $kategori";
  }
}

class TokoBuku {
  List<Book> books = [];

  void tambahBuku(
      String id, String judul, String penerbit, double harga, String kategori) {
    books.add(
      Book(
          id: id,
          judul: judul,
          penerbit: penerbit,
          harga: harga,
          kategori: kategori),
    );
  }

  List<Book> dataBuku() {
    return books;
  }

  void hapusBuku(String id) {
    books.removeWhere((book) => book.id == id);
    print("\nBuku dengan ID $id Terhapus!");
  }
}

void main() {
  TokoBuku tokoBuku = TokoBuku();
  List<Book> semuaBuku = tokoBuku.dataBuku();
  semuaBuku = tokoBuku.dataBuku();

  // menambahkan data buku
  tokoBuku.tambahBuku("13020", "Flutter Course", "Budi", 70.000, "Edukasi");
  tokoBuku.tambahBuku("13021", "Dilan", "Pidi baiq", 100.000, "Novel");
  tokoBuku.tambahBuku("13022", "Doraemon", "Fujiko Fujio", 100.000, "Comic");

  // melihat Semua buku
  print("Berikut buku yang tersedia:");
  semuaBuku.forEach((book) => print(book.toString()));

  // menghapus Buku
  tokoBuku.hapusBuku("13021");

  // get all books after removal
  print("\nData Buku Setelah menghapus:");
  semuaBuku.forEach((book) => print(book.toString()));
}
