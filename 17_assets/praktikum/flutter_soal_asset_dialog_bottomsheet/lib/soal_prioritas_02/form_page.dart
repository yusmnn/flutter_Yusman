import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'drawer_widget.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class ListItem {
  late String title;
  late String subtitle;

  ListItem({required this.title, required this.subtitle});
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final List<ListItem> _listItems = [];
  final _editNameController = TextEditingController();
  final _editNumberPhoneController = TextEditingController();

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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: _listItems.length,
                  itemBuilder: (BuildContext context, index) {
                    final item = _listItems[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 28, 0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xffEADDFF),
                          foregroundColor: Colors.black,
                          child: Text(item.title[0].toUpperCase()),
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
                                _editNumberPhoneController.text = item.subtitle;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Ganti Contact'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          TextField(
                                            decoration: const InputDecoration(
                                                labelText: 'Nama'),
                                            controller: _editNameController,
                                          ),
                                          TextField(
                                            decoration: const InputDecoration(
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
                                                  _editNameController.text;
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
}
