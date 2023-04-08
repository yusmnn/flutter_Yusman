import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/drawer.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  Map<String, dynamic> putData = {};
  TextEditingController textarea = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateUser();
  }

  Future updateUser() async {
    try {
      Dio dio = Dio();
      final Response response = await dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'userId': 1,
          'title': titleController.text,
          'body': textarea.text,
        },
      );

      setState(() {
        putData = response.data;
        debugPrint('Response: $putData');
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
        title: const Text('Put Page'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                onChanged: (value) => setState(() {
                  value = titleController.text;
                }),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE7E0EC),
                  labelText: 'Title',
                  hintText: 'Your Title',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE7E0EC),
                  hintText: "Enter Your Text Here",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (titleController.text.isNotEmpty &&
                      textarea.text.isNotEmpty) {
                    await updateUser();
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Success'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Title\t: ${putData['title']}'),
                              Text('Body\t: ${putData['body']}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
