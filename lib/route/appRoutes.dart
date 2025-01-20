import 'package:flutter/material.dart';
import '../homeScreen/homeScreen.dart';

class appRoutes{
  static const String homeScreen = '/homeScreen';

  static const String  initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => homeScreen(),
    initialRoute: (context) => homeScreen()
  };
}