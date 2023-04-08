import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_rest_api/widget/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceBearPage extends StatefulWidget {
  const DiceBearPage({super.key});

  @override
  DiceBearPageState createState() => DiceBearPageState();
}

class DiceBearPageState extends State<DiceBearPage> {
  String imageUrl = '';
  late final generateSeedController = TextEditingController();

  late final _formkey = GlobalKey<FormState>();

  void fetchAvatar() async {
    const url = 'https://api.dicebear.com/6.x/pixel-art/svg?';

    try {
      final response = await Dio().get(
        url,
        queryParameters: {
          'seed': generateSeedController.text,
        },
      );

      setState(() {
        imageUrl = response.data;
        debugPrint('Response: $imageUrl');
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear API Page'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageUrl.isNotEmpty
                  ? SvgPicture.string(
                      imageUrl,
                      width: 200,
                      height: 200,
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey,
                    ),
              const SizedBox(height: 20),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: generateSeedController,
                        onChanged: (value) => setState(() {
                          value = generateSeedController.text;
                        }),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7E0EC),
                          labelText: 'Generate Text',
                          hintText: 'Enter Text to Generate Image',
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.deepPurple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: fetchAvatar,
                child: const Text('Generate Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
