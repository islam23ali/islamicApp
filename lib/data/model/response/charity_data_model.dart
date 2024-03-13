import 'package:islamic_app/data/model/response/charity_model.dart';
import 'package:islamic_app/data/model/response/order_model.dart';

class CharityDataModel {
  int? code;
  List<CharityModel>? data;
  String? message;

  CharityDataModel({
    this.code,
    this.data,
    this.message,
  });

  factory CharityDataModel.fromJson(Map<String, dynamic> json) => CharityDataModel(
    code: json["code"],
    data: json["data"] == null ? null : List<CharityModel>.from(json["data"].map((x) => CharityModel.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}






