import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/models_contacts.dart';
import '../providers/list_contacts.dart';
import '../widgets/drawer_widget.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({super.key});

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phoneNumber = '';

  final _nameController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final _editNameController = TextEditingController();
  final _editNumberPhoneController = TextEditingController();

  late DateTime _dueDate = DateTime.now();
  final currenDate = DateTime.now();
  Color _currentColor = const Color(0xff6750A4);

  final DateFormat formatter = DateFormat('dd MMMM yyyy');

  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberPhoneController.dispose();
    _editNameController.dispose();
    _editNumberPhoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactsModel = Provider.of<ContactsModel>(context);

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
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Name',
                          hintText: 'Insert Your Name'),
                      onChanged: (String value) {
                        name = value;
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
                      controller: _numberPhoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Nomor',
                          hintText: '+62 ....'),
                      onChanged: (String value) {
                        phoneNumber = value;
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
                              'Pick Image',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff6750A4),
                                    borderRadius: BorderRadius.circular(4),
                                    image: image != null
                                        ? DecorationImage(
                                            image: FileImage(image!),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: image == null
                                      ? const Icon(
                                          Icons.add_a_photo,
                                          color: Colors.black,
                                        )
                                      : null,
                                ),
                              ),
                            ),
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
                      if (_formKey.currentState!.validate()) {
                        final contact = Contact(
                          name: name,
                          numberPhone: phoneNumber,
                          image: FileImage(image!),
                          color: _currentColor,
                        );
                        contactsModel.addContact(contact);
                      }
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
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: contactsModel.contacts.length,
                itemBuilder: (BuildContext context, index) {
                  final item = contactsModel.contacts[index];
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
                                backgroundColor: item.color!,
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
                                    image: item.image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                color: Color(0xff1C1B1F),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            subtitle: Text(
                              item.numberPhone,
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
                                    _editNameController.text = item.name;
                                    _editNumberPhoneController.text =
                                        item.numberPhone;
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
                                                controller: _editNameController,
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
                                                  item.name =
                                                      _editNameController.text;
                                                  item.numberPhone =
                                                      _editNumberPhoneController
                                                          .text;
                                                });
                                                item.name =
                                                    _editNameController.text;
                                                item.numberPhone =
                                                    _editNumberPhoneController
                                                        .text;
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
                                    contactsModel.removeContact(
                                        contactsModel.contacts[index]);
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/delete.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
