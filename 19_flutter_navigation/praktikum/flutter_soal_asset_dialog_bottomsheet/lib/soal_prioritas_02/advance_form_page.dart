import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'drawer_widget.dart';

class AdvanceFormPage extends StatefulWidget {
  const AdvanceFormPage({super.key});

  @override
  State<AdvanceFormPage> createState() => _AdvanceFormPageState();
}

class ListItem {
  late String title;
  late String subtitle;

  ListItem({required this.title, required this.subtitle});
}

class _AdvanceFormPageState extends State<AdvanceFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final List<ListItem> _listItems = [];
  final _editNameController = TextEditingController();
  final _editNumberPhoneController = TextEditingController();

  late DateTime _dueDate = DateTime.now();
  final currenDate = DateTime.now();
  Color _currentColor = const Color(0xff6750A4);

  File? image;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 81,
                  ),
                  SvgPicture.asset(
                    'assets/icons/mobile_friendly.svg',
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text(
                    'Create New Contacts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff1C1B1F),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    '''A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff49454F),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1.0,
                color: Color(0xffCAC4D0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Name',
                          hintText: 'Insert Your Name'),
                      onChanged: (value) {
                        _nameController.text = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama harus diisi oleh user';
                        } else if (value.split(' ').length < 2) {
                          return 'Nama harus terdiri dari minimal 2 kata';
                        } else if (value.contains(RegExp(r'[0-9]')) ||
                            value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Nama tidak boleh mengandung angka atau karakter khusus';
                        } else if (value.split(' ').any((element) =>
                            element[0] != element[0].toUpperCase())) {
                          return 'Setiap kata harus dimulai dengan huruf kapital';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Nomor',
                          hintText: '+62 ....'),
                      onChanged: (value) {
                        _numberPhoneController.text = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nomor harus diisi oleh user';
                        } else if (value.contains(RegExp(r'[a-zA-Z]')) ||
                            value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Nomor telepon harus terdiri dari angka saja';
                        } else if (value.length < 8 || value.length > 15) {
                          return 'Panjang nomor telepon harus antara 8 dan 15 digit';
                        } else if (!RegExp(r'^0\d*').hasMatch(value)) {
                          return 'Nomor telepon harus diawali dengan angka 0';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        buildDatePicker(context),
                        const SizedBox(
                          height: 20,
                        ),
                        buildColorPicker(context),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pick Profile Picture',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await getImage();
                                },
                                child: const Text('Pick Image'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1.0,
                color: Color(0xffCAC4D0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xff6750A4),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          _listItems.add(
                            ListItem(
                              title: _nameController.text,
                              subtitle: _numberPhoneController.text,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                'Success',
                              ),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 49,
            ),
            const Center(
              child: Text(
                'List Contacts',
                style: TextStyle(
                  color: Color(0xff1C1B1F),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 64),
              child: Card(
                color: const Color(0xffFFFBFE),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _listItems.length,
                  itemBuilder: (BuildContext context, index) {
                    final item = _listItems[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 28, 0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CircleAvatar(
                                  backgroundColor: _currentColor,
                                  radius: 8,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy').format(_dueDate),
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                _listItems[index].title,
                                style: const TextStyle(
                                  color: Color(0xff1C1B1F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              subtitle: Text(
                                _listItems[index].subtitle,
                                style: const TextStyle(
                                  color: Color(0xff49454F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _editNameController.text = item.title;
                                      _editNumberPhoneController.text =
                                          item.subtitle;
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Ganti Contact'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText: 'Nama'),
                                                  controller:
                                                      _editNameController,
                                                ),
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText: 'Nomor'),
                                                  controller:
                                                      _editNumberPhoneController,
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _listItems[index].title =
                                                        _editNameController
                                                            .text;
                                                    _listItems[index].subtitle =
                                                        _editNumberPhoneController
                                                            .text;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Save'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/mode_edit.svg',
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _listItems.removeAt(index);
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/delete.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: Color(0xffCAC4D0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
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

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
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
}
