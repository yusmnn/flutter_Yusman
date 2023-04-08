import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widget/drawer.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  Map<String, dynamic> contactData = {};

  @override
  void initState() {
    super.initState();
    createContact();
  }

  Future createContact() async {
    try {
      Dio dio = Dio();
      String url =
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

      Map<String, dynamic> contacts = {
        'name': _nameController.text,
        'phone': _numberPhoneController.text,
      };
      Response response = await dio.post(url, data: contacts);
      setState(() {
        contactData = response.data;
        debugPrint('Response: $contactData');
      });
    } catch (error) {
      debugPrint('Error: $error');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Page'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  onChanged: (value) => setState(() {
                    value = _nameController.text;
                  }),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffE7E0EC),
                    labelText: 'Name',
                    hintText: 'Your Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.deepPurple),
                    ),
                  ),
                  validator: validateFormUsername,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _numberPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffE7E0EC),
                    labelText: 'Number Phone',
                    hintText: '+62 ....',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.deepPurple),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    value = _numberPhoneController.text;
                  }),
                  validator: validateFormNumberPhone,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await createContact();
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => successContact(),
                        );
                      }
                    }
                  },
                  child: const Text('Create'),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateFormNumberPhone(value) {
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
  }

  String? validateFormUsername(value) {
    if (value!.isEmpty) {
      return 'Nama harus diisi oleh user';
    } else {
      return null;
    }
  }

  Widget successContact() {
    return AlertDialog(
      title: const Text('Contact Created!'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Name\t: ${contactData['name']}'),
          Text('Phone\t: ${contactData['phone']}'),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ],
    );
  }
}
