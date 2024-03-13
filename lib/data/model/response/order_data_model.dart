import 'package:islamic_app/data/model/response/order_model.dart';

class OrderDataModel {
  int? code;
  List<OrderModel>? data;
  String? message;

  OrderDataModel({
    this.code,
    this.data,
    this.message,
  });

  factory OrderDataModel.fromJson(Map<String, dynamic> json) => OrderDataModel(
    code: json["code"],
    data: json["data"] == null ? null : List<OrderModel>.from(json["data"].map((x) => OrderModel.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}






