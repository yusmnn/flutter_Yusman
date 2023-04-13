import 'package:flutter/material.dart';
import 'package:flutter_contactapp_mvvm/utils/routes/routes_name.dart';

import '../../views/screens/contact_app/contact_screen.dart';
import '../../views/screens/dice_bear_app/dice_bear_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.contactPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ContactScreen());
      case RoutesName.imageGenerate:
        return MaterialPageRoute(
            builder: (BuildContext context) => DiceBearImageForm());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ContactScreen());
    }
  }
}
