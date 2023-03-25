## Resume Materi KMFlutter – Dialog Bottom Sheet
### AlertDialog
- untuk tampilan android dari material design
- menginformasikan pengguna tentang situasi tertentu
- bisa digunakan untuk input dari user
- membutuhkan helper method showDialog
```
  // Membuat fungsi dialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Title'),
          content: Text('Content'),
          actions: [
            TextButton(
              onPressed: () {
                // block code jika user klik Yes
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                // blok code jika user klik No
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

```
### BottomSheet
- seperti dialog tetapi muncul dari bawah layar aplikasi
- menggunakan fungsi bawaan flutter showModalBottomSheet
- membutuhkan dua property, yaitu context dan builder
```
  // membuat fungsi bottom sheet
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Text('Bottom Sheet Content'),
          ),
        );
      },
    );
  }

```
- fungsi tersebut bisa digunakan di widget yang bisa mengakses ```BuildContext``` object:
```
  ElevatedButton(
    onPressed: () {
      _showBottomSheet();
    },
    child: Text('Show Bottom Sheet'),
  ),

```