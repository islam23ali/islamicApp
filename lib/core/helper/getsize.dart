import 'package:flutter/cupertino.dart';

class GetSize{
  static double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}