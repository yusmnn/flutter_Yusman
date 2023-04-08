import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/drawer.dart';
import 'deserialisasi_model.dart';

class DeserialisasiPage extends StatefulWidget {
  const DeserialisasiPage({super.key});

  @override
  DeserialisasiPageState createState() => DeserialisasiPageState();
}

class DeserialisasiPageState extends State<DeserialisasiPage> {
  Contact _contact = Contact();

  @override
  void initState() {
    super.initState();
    _fetchContactData();
  }

  Future<void> _fetchContactData() async {
    try {
      String url =
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2';
      Response response = await Dio().get(url);
      setState(() {
        _contact = Contact.jsonDecode(response.data);
        debugPrint('Response: ${response.data}');
      });
    } catch (error) {
      debugPrint('Error fetching contact data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deserialisasi Page'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: _contact.id == null
            ? const CircularProgressIndicator()
            : Container(
                padding: const EdgeInsets.all(15),
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.purple[50]),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('ID',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(width: 220, child: Text(': ${_contact.id}'))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(width: 220, child: Text(': ${_contact.name}'))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('Phone',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(width: 220, child: Text(': ${_contact.phone}'))
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
