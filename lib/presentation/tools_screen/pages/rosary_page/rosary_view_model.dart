
import 'package:flutter/material.dart';
import '../../../../data/repository/SaveUserData.dart';

class RosaryViewModel with ChangeNotifier {
  // final ToolsRepo toolsRepo;
  final SaveUserData saveUserData;

  RosaryViewModel({required this.saveUserData, });

  ///variables
  // bool _isLoading = false;

  // TextEditingController rosaryTextController =TextEditingController();

  // List <String> rosaryItems =[];

  int number=0;
  double status=0.0;
  ///getters
  // bool get isLoading => _isLoading;
  ///calling APIs Functions



  void increaseNumber() {
      number++;
      if (status < 1.0) {
        status += 0.1;
      }else{
          status=0.1;
      }
  }

  refreshData(){
    notifyListeners();
  }
}
