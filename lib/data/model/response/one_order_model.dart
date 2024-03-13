
import 'package:islamic_app/data/model/response/order_model.dart';

class OneOrderModel {
  int? code;
  OrderModel? data;
  String? message;

  OneOrderModel({
    this.code,
    this.data,
    this.message,
  });

  factory OneOrderModel.fromJson(Map<String, dynamic> json) => OneOrderModel(
    code: json["code"],
    data: json["data"] == null ? null : OrderModel.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

