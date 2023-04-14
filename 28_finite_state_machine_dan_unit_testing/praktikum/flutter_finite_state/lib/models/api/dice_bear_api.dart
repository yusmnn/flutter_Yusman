import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DiceBearApi {
  Future<dynamic> getAvatar(TextEditingController textEditingController) async {
    const url = 'https://api.dicebear.com/6.x/pixel-art/svg?';
    try {
      final response = await Dio().get(
        url,
        queryParameters: {
          'seed': textEditingController.text,
        },
      );

      return response.data;
    } catch (error) {
      debugPrint('Error: $error');
      rethrow;
    }
  }
}
