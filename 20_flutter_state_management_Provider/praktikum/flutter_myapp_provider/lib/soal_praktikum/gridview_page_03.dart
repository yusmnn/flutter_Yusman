import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

import 'gridview_list_page.dart';

class ImageData {
  final String imageUrl;

  ImageData(this.imageUrl);
}

class GridViewPageTwo extends StatefulWidget {
  const GridViewPageTwo({super.key});

  @override
  State<GridViewPageTwo> createState() => _MyHomePageGridViewState();
}

class _MyHomePageGridViewState extends State<GridViewPageTwo> {
  final List<ImageData> _selectedImages = [];
  final List<String> _images = [
    'assets/images/img_1.jpg',
    'assets/images/img_2.jpg',
    'assets/images/img_3.jpg',
    'assets/images/img_4.jpg',
    'assets/images/img_5.jpg',
    'assets/images/img_6.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gridview Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GridViewList(selectedImages: _selectedImages),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(
            _images.length,
            (index) => InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(_images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  )),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Card(
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                                bottom: Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage(_images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              const SizedBox(height: 16),
                              const Text(
                                'Apakah anda ingin menambahkan gambar ini?',
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Konfirmasi'),
                                    content: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          image: AssetImage(_images[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const GridViewPageTwo(),
                                          ),
                                          (route) => route.isFirst,
                                        ),
                                        child: const Text('Tidak'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedImages
                                                .add(ImageData(_images[index]));
                                          });

                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GridViewList(
                                                selectedImages: _selectedImages,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Iya',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Text('Tambahkan'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
