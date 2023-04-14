import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/models/food_model.dart';

class FoodApi {
  Future<List<Food>> getFoods() async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

    try {
      List<Food> foods = (response.data as List)
          .map(
            (e) => Food(
              id: e['id'],
              name: e['name'],
            ),
          )
          .toList();

      return foods;
    } catch (error) {
      debugPrint('Error: $error');
      rethrow;
    }
  }
}
