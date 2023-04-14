
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/form_widget.dart';
import 'dice_bear_view_model.dart';

class DiceBearImageForm extends StatelessWidget {
  DiceBearImageForm({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageViewModel>(
      create: (_) => ImageViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DiceBear Image Generator'),
          centerTitle: true,
        ),
        drawer: const RouterWidget(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Consumer<ImageViewModel>(
                builder: (context, imageViewModel, _) => Form(
                  key: GlobalKey<FormState>(),
                  child: FormInputText(textController: _textController),
                ),
              ),
              const SizedBox(height: 16.0),
              Consumer<ImageViewModel>(
                builder: (context, imageViewModel, _) => ElevatedButton(
                  onPressed: () => imageViewModel.getAvatar(
                    _textController.text,
                  ),
                  child: const Text('Generate Image'),
                ),
              ),
              const SizedBox(height: 16.0),
              Consumer<ImageViewModel>(
                builder: (context, imageViewModel, _) {
                  final imageUrl = imageViewModel.imageUrl;
                  return imageUrl.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2.0,
                            ),
                          ),
                          child: SvgPicture.string(
                            imageUrl,
                            width: 200,
                            height: 200,
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.person_2_rounded,
                            size: 54,
                            color: Colors.white,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
