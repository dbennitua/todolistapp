import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// my reference for responsive UI
const num WIDTH = 430;
const num HEIGTH = 932;
const num STATUSBAR = 0;
const String dateTimeFormart = 'dd/MM/yyyy';

extension ResponsiveExtension on num{
  double get _width => SizeUtils.width;
  double get h => ((this * _width) / WIDTH);
  double get fSize => ((this * _width) / WIDTH);
}

extension FormartExtension on double{
  double toDoubleValue({int fractionDigits = 2}){
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}){
    return this > 0 ? this : defaultValue.toDouble();
  }
}

extension DateTimeExtension on DateTime{
  String formart({
    String pattern = dateTimeFormart,
    String? locale,
  }){
    if(locale != null && locale.isNotEmpty){
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern,locale).format(this);
  }
}

class SizeUtils{
  // Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  //Device's Orientation
  static late Orientation orientation;

  // Type Of Device
  static late DeviceType deviceType;

  // Device's Height
  static late double height;

  // Device's Width
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ){
    boxConstraints = constraints;
    orientation = currentOrientation;
    if(orientation == Orientation.portrait){
      width = boxConstraints.maxWidth.isNonZero(defaultValue: WIDTH);
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

class homeScreen extends StatelessWidget {
  homeScreen({Key? key}) : super(key: key,);

  TextEditingController searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF020206),
    );
  }
}
