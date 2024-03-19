
import 'package:flutter/material.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../data/repository/store_keeper_repo.dart';

class ToolsViewModel with ChangeNotifier {
  final StoreKeeperRepo storeKeeperRepo;
  final SaveUserData saveUserData;

  ToolsViewModel({required this.saveUserData, required this.storeKeeperRepo});

  ///variables
  bool _isLoading = false;

  // StockItemsModel? _stockItemsModel;




  TextEditingController rosaryTextController =TextEditingController();
  List <String> rosaryItems =[];


  ///getters
  bool get isLoading => _isLoading;


  ///setters

  // StockItemsModel? get stockItemsModel => _stockItemsModel;





  ///calling APIs Functions

  // Future<ApiResponse> stockItemsAPI(BuildContext context) async {
  //   _isLoading = true;
  //   // notifyListeners();
  //   ApiResponse responseModel = await storeKeeperRepo.stockItemsRepo();
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _isLoading = false;
  //     _stockItemsModel = StockItemsModel.fromJson(responseModel.response?.data);
  //
  //
  //   } else {
  //     _isLoading = false;
  //     ApiChecker.checkApi(context, responseModel);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }
  refreshData(){
    notifyListeners();
  }
}
