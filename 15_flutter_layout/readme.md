## Resume Materi Flutter – Flutter Layout
### Pengertian Layout
  - untuk mengatur tata letak di page
  - layout berbentuk widget yang mengatur widget di dalamnya

### Single-Child Layout
  - Container
    - membuat sebuah box
    - membungkus widget lain
    - Box memiliki margin, padding, dan border
      ```
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Text('teks'),
        ),
      ```
  - Center
    - Membuat sebuah box
    - membungkus widget lain
    - memenuhi lebar dan tinggi ruang diluarnya
    - meletakkan widget berada di bagian tengah
      ```
        Center(
          child: const Text('text'),
        ),
      ```
  - SizedBox
    - Membuat sebuah box
    - membungkus widget lain
    - box dapat diatur lebar dan tingginya
    - lebih sederhana dari Container
      ```
        SizedBox(
          width: 150,
          height: 150,
          child: Text('teks'),
        )
      ```

### Multi-Child Layout
  - Column
    - mengatur widgets secara vertical
    - dapat menampung banyak widget
      ```
        Column(
          children: const [
            Text('teks'),
            Text('teks'),
            Text('teks'),
            Text('teks'),
          ],
        )
      ```
  - Row
    - mengatur widgets secara horizontal
    - dapat menampung banyak widget
      ```
        ROW(
          children: const [
            Text('teks'),
            Text('teks'),
            Text('teks'),
            Text('teks'),
          ],
        )
      ```
  - ListView
    - mengatur widgets dalam bentuk list
    - memiliki kemampuan scroll
      ```
        ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
          ],
        )
      ```
  - GridView
    - mengatur widgets dalam bentuk galeri
      ```
        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Heed not the rabble'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sound of screams but the'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Who scream'),
            ),
          ],
        )
      ```
    