## Resume Materi KMFlutter – Flutter Form
### Form
  - menerima isian data dari pengguna
  - isian data dapat lebih dari satu
  - menggunakan stateful widget
  - keadaan form disimpan menggunakan GlobalKey<FormState>
    ```
      var FormKey = GlobalKey<FormState>();

      Form(
        key: formKey,
        child: inputWidgets,
      );
    ```

### Input
  - TextField
    - menerima isian data dari pengguna
    - isian data dapat lebih dari satu
    - data diambil menggunakan TextEditingController()
    - isian data berupa teks
    ```
      var inputController = TextEditingController();

      TextField(
        controller: inputController,
      );
    ```
  - Radio
    - memberi opsi pada pengguna
    - hanya dapat memilih satu opsi
    - data diambil menggunakan property dengan tipe data sesuai value pada radio
    ```
    SingingCharacter? _character = SingingCharacter.lafayette;

      Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
    ```

  - CheckBox
    - memberi opsi pada pengguna
    - dapat memilih beberapa opsi
    - data diambil menggunakan tiper data bool
    ```
      bool isChecked = false;

      Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      );
    ```
  
  - DropDown Button
    - memberi opsi pada pengguna
    - hanya dapat memilih satu opsi
    - opsi tidak ditampilkan diawal, hanya tampil jika ditekan
    - data diambil menggunakan properti dengan tipe data sesuai dengan value pada DropDownMenuItem
    ```
      String dropdownValue = list.first;

      DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    ```

### Button
  - Bersifat seperti tombol
  - dapat melakukan sesuatu saat ditekan
  - ElevatedButton
    - tombol yang timbul
    - jika ditekan, akan menjalankan onPressed
    ```
      ElevatedButton(
        child: const Text('Submit');
        onPressed: () {
          //Code
        }
      )
    ```
  - IconButton
    - tombol yang hanya menampilkan icon
    - jika ditekan, akan menjalankan onPressed
    ```
      IconButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Code
        }
      )
    ```

## Resume Materi KMFlutter – Flutter Advance Form
### Date Picker
  - Widget dimana user bisa memasukkan tanggal
  - tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting dll
  - menambahkan package ```intl``` di pubspec.yaml
  ```
    late DateTime _dueDate = DateTime.now();
    final currenDate = DateTime.now();

    Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final selectData = await showDatePicker(
                  context: context,
                  initialDate: currenDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currenDate.year + 5),
                );
                setState(() {
                  if (selectData != null) {
                    _dueDate = selectData;
                  }
                });
              },
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        ),
      ],
    );
  }
  ```

### Color Picker
  - Widget dimana user bisa memilih warna
  - penggunaan color picker bisa digunakan dalam berbagai macam kondisi
  - menggunakan packages flutter_colorpicker
  - packages flutter_colorpicker memiliki custom widget yang dapat digunakan seperti BlockPicker, ColorPicker, dan SlidePicker
  ```
    Color _currentColor = Colors.orange;

    Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
            ),
            child: const Text('Pick Color'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          }),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      )
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
  ```
### File Picker
  - widget yang dapat mengakses storage
  - dapat memilih dan membuka file
  - menggunakan package file_picker dan open_file
  ```
    // membuat UI
    Widget buildFilePicker() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pick Files'),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _pickFile();
              },
              child: const Text('Pick and Open File'),
            ),
          )
        ],
      );
    }

    // mengambil file dari object result dan memanggil fungsi _openfile didalam fungsi _pickFile
    void _pickFile() async {
      final result = await FilePicker.platform.pickFiles();
      if (result == null) {
        return;
      }

      final file = result.files.first;
      _openFile(file);
    }

    // membuat fungsi untuk membuka files yang dipilih
    void _openFile(PlatformFile file) {
      OpenFile.open(file.path);
    }
  ```