import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class suraDetailsProvider extends ChangeNotifier{
  List<String> verses = [];

  void readsurafile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    notifyListeners();
  }



}