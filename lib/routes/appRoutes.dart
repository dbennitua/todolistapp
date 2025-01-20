import 'package:flutter/material.dart';
import '../homeScreen/homeScreen.dart';

class appRoutes{
  static const String HomeScreen = '/homeScreen';

  static const String  initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    HomeScreen: (context) => homeScreen(),
    initialRoute: (context) => homeScreen()
  };
}