import 'package:islamic_app/data/model/response/report_model.dart';

class ReportDataModel {
  String? message;
  int? code;
  List<ReportModel>? data;

  ReportDataModel({
    this.message,
    this.code,
    this.data,
  });

  factory ReportDataModel.fromJson(Map<String, dynamic> json) => ReportDataModel(
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<ReportModel>.from(json["data"]!.map((x) => ReportModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}





class UserStore {
  int? id;
  int? storeId;
  Store? store;

  UserStore({
    this.id,
    this.storeId,
    this.store,
  });

  factory UserStore.fromJson(Map<String, dynamic> json) => UserStore(
    id: json["id"],
    storeId: json["store_id"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "store": store?.toJson(),
  };
}

class Store {
  int? id;
  String? name;

  Store({
    this.id,
    this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}