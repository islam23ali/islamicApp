import 'history_signature.dart';
import 'user_model.dart';

class DistributionReportDataModel {
  int? code;
  DistibutionModel? data;
  String? message;

  DistributionReportDataModel({
    this.code,
    this.data,
    this.message,
  });

  factory DistributionReportDataModel.fromJson(Map<String, dynamic> json) => DistributionReportDataModel(
    code: json["code"],
    data: json["data"] == null ? null : DistibutionModel.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

class DistibutionModel {
  int? id;
  int? userId;
  User? user;
  String? doneMealCount;
  String? doneWaterCount;
  String? returnMealCount;
  String? returnWaterCount;
  int? signatureStep;
  String? date;
  List<HistorySignature>? historySignature;

  DistibutionModel({
    this.id,
    this.userId,
    this.user,
    this.doneMealCount,
    this.doneWaterCount,
    this.returnMealCount,
    this.returnWaterCount,
    this.signatureStep,
    this.date,
    this.historySignature,
  });

  factory DistibutionModel.fromJson(Map<String, dynamic> json) => DistibutionModel(
    id: json["id"],
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    doneMealCount: json["done_meal_count"],
    doneWaterCount: json["done_water_count"],
    returnMealCount: json["return_meal_count"],
    returnWaterCount: json["return_water_count"],
    signatureStep: json["signature_step"],
    date: json["date"] == null ? null :json["date"],
    historySignature: json["history_signature"] == null ? [] : List<HistorySignature>.from(json["history_signature"]!.map((x) => HistorySignature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user": user?.toJson(),
    "done_meal_count": doneMealCount,
    "done_water_count": doneWaterCount,
    "return_meal_count": returnMealCount,
    "return_water_count": returnWaterCount,
    "signature_step": signatureStep,
    "date": date,
    "history_signature": historySignature == null ? [] : List<HistorySignature>.from(historySignature!.map((x) => x.toJson())),
  };
}


