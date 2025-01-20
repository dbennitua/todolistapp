import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'route/appRoutes.dart';
import 'homeScreen/homeScreen.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Sizer(
      builder: (context,orientation,deviceType){
        return MaterialApp(
          title: 'To Do List',
          debugShowCheckedModeBanner: false,
          initialRoute: appRoutes.initialRoute,
          routes: appRoutes().routes,
          builder: (context,child){
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.0)
              ),
              child: child!
            );
          },
        );
      }
    );
  }
}
