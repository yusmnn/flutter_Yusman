import 'package:flutter/material.dart';
import 'package:flutter_contactapp_mvvm/utils/routes/routes_name.dart';

import '../../views/screens/contact_screens/contact_screen.dart';
import '../../views/screens/dice_bear_screens/dice_bear_screen.dart';
import '../../views/screens/food_screens/food_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.contactPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ContactScreen());
      case RoutesName.imageGenerate:
        return MaterialPageRoute(
            builder: (BuildContext context) => DiceBearImageForm());
      case RoutesName.foodPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FoodScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ContactScreen());
    }
  }
}
