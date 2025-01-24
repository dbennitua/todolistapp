import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'routes/appRoutes.dart';
import 'homeScreen/homeScreen.dart';
import 'package:todolistapp/utils/utils.dart';

//Global key to manage snack-bars and notifications across the app
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main(){
  WidgetsFlutterBinding.ensureInitialized(); //Ensuring all flutter widgets are initialized before running my app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //Locking my app orientation to portrait mode
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
          routes: appRoutes.routes,
          builder: (context,child){
            //using this media-query to ensure a consistent text scaling across devices to ensure a consistent ui look
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
