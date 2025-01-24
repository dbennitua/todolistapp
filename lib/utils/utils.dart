import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// my base reference for responsive UI
const num WIDTH = 430;
const num HEIGTH = 932;
const num STATUSBAR = 0;
const String dateTimeFormart = 'dd/MM/yyyy';

// adding custom functionalities to existing type 'num'
extension ResponsiveExtension on num{
  double get _width => SizeUtils.width; // retrieves the current screen width from sizeUtils
  double get h => ((this * _width) / WIDTH); // this formula gets the proportional height based on the width
  double get fSize => ((this * _width) / WIDTH);// this formula scales the font size based on the screen width
}

// adding custom custom functionalities to the existing type 'double'
extension FormartExtension on double{
  double toDoubleValue({int fractionDigits = 2}){// this rounds every double to 2 decimal places
    return double.parse(this.toStringAsFixed(fractionDigits));//converts double to a string and fixes it's precision then parses it back and returns it as a double
  }

  //this function sets a default value for constrains if it's 0 or missing
  double isNonZero({num defaultValue = 0.0}){
    return this > 0 ? this : defaultValue.toDouble();
  }
}

// adding a formal utility to the datetime class
extension DateTimeExtension on DateTime{
  String formart({String pattern = dateTimeFormart, String? locale,}){
    if(locale != null && locale.isNotEmpty){
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern,locale).format(this);
  }
}

//custom utility class to manage screen dimensions and orientation
class SizeUtils{
  // Device's BoxConstraints - stores the devices constraints (max width/height)
  static late BoxConstraints boxConstraints;

  //Device's Orientation - is it portrait or landscape?
  static late Orientation orientation;

  // Type Of Device
  static late DeviceType deviceType;

  // Device's Height - stores height
  static late double height;

  // Device's Width - stores width
  static late double width;

  // this method will configure and set the screen dimensions and device type based on the device's boxconstraints and orientation.
  static void setScreenSize(BoxConstraints constraints, Orientation currentOrientation,){
    boxConstraints = constraints;
    orientation = currentOrientation;
    if(orientation == Orientation.portrait){
      width = boxConstraints.maxWidth.isNonZero(defaultValue: WIDTH); //sets the default value to my already set width if the value is 0 or invalid
      height = boxConstraints.maxHeight.isNonZero();
    }else{
      width = boxConstraints.maxHeight.isNonZero(defaultValue: WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}



enum DeviceType{mobile ,tablet, desktop}
typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType
    );


// this rebuilds the UI whenever orientation changes(will most probably not be needed since i'll be making this app a fixed portrait app. but it's good for future extensibility)
class Sizer extends StatelessWidget{
  const Sizer({Key? key,required this.builder}) : super(key:key);

  // this builds the widget whenever the orientation changes
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (context,constraints){
      return OrientationBuilder(builder: (context,orientation){
        SizeUtils.setScreenSize(constraints,orientation);
        return builder(context,orientation,SizeUtils.deviceType);
      });
    });
  }
}
