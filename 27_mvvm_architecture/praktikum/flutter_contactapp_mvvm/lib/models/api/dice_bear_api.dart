import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// class DiceBearApi {
//   TextEditingController generateAvatar = TextEditingController();

//   DiceBearApi(this.generateAvatar);
//   Future<dynamic> getAvatar(TextEditingController textEditingController) async {
//     const url = 'https://api.dicebear.com/6.x/pixel-art/svg?';
//     try {
//       final response = await Dio().get(
//         url,
//         queryParameters: {
//           'seed': generateAvatar.text,
//         },
//       );

//       dynamic avatar = response.data;
//       debugPrint('Avatar: $avatar');
//       return avatar;
//     } catch (error) {
//       debugPrint('Error: $error');
//       rethrow;
//     }
//   }
// }

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
