import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/dice_bear_model.dart';

enum ImageViewState {
  none,
  loading,
  error,
}

class ImageViewModel extends ChangeNotifier {
  String _imageUrl = '';

  String get imageUrl => _imageUrl;

  Future<dynamic> getAvatar(String textGenerate) async {
    const url = 'https://api.dicebear.com/6.x/pixel-art/svg?';
    try {
      final response = await Dio().get(
        url,
        queryParameters: {
          'seed': textGenerate,
        },
      );

      _imageUrl = response.data;
      debugPrint('Image: $_imageUrl');
      notifyListeners();
    } catch (error) {
      debugPrint('Error: $error');
      rethrow;
    }
  }

  ImageModel getImageModel() {
    return ImageModel(_imageUrl);
  }
}
