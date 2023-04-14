import 'package:flutter/material.dart';

import '../../../models/api/food_api.dart';
import '../../../models/food_model.dart';

class FoodViewModel with ChangeNotifier {
  late List<Food> _foods = [];
  List<Food> get foods => _foods;

  getAllFoods() async {
    final dataFood = await FoodApi().getFoods();
    _foods = dataFood;
    notifyListeners();
  }
}
