import 'package:flutter/material.dart';
import 'package:flutter_soal_asset_dialog_bottomsheet/soal_prioritas_03/gridview_page_03.dart';

class GridViewListTiga extends StatefulWidget {
  const GridViewListTiga({Key? key, required this.selectedImages})
      : super(key: key);

  final List<ImageData> selectedImages;

  @override
  State<GridViewListTiga> createState() => _GridViewListTigaState();
}

class _GridViewListTigaState extends State<GridViewListTiga> {
  late List<ImageData> _selectedImages;

  @override
  void initState() {
    super.initState();
    _selectedImages = widget.selectedImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Images'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(
            _selectedImages.length,
            (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(_selectedImages[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
