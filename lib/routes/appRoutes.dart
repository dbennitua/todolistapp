import 'package:flutter/material.dart';
import '../homeScreen/homeScreen.dart';
import '../createTaskScreen/createTaskScreen.dart';

class appRoutes{
  static const String HomeScreen = '/homeScreen';
  static const String CreateTaskScreen = '/createTaskScreen';

  static const String  initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    HomeScreen: (context) => homeScreen(),
    CreateTaskScreen: (context) => createTaskScreen(),
    initialRoute: (context) => homeScreen(),
  };
}