class DistributionDataModel {
  int? code;
  DistributionModel? data;
  String? message;

  DistributionDataModel({
    this.code,
    this.data,
    this.message,
  });

  factory DistributionDataModel.fromJson(Map<String, dynamic> json) => DistributionDataModel(
    code: json["code"],
    data: json["data"] == null ? null : DistributionModel.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

class DistributionModel {
  int? mealDataToday;
  String? mealDataMonth;
  int? waterDataToday;
  String? waterDataMonth;

  DistributionModel({
    this.mealDataToday,
    this.mealDataMonth,
    this.waterDataToday,
    this.waterDataMonth,
  });

  factory DistributionModel.fromJson(Map<String, dynamic> json) => DistributionModel(
    mealDataToday: json["meal_data_today"],
    mealDataMonth: json["meal_data_month"],
    waterDataToday: json["water_data_today"],
    waterDataMonth: json["water_data_month"],
  );

  Map<String, dynamic> toJson() => {
    "meal_data_today": mealDataToday,
    "meal_data_month": mealDataMonth,
    "water_data_today": waterDataToday,
    "water_data_month": waterDataMonth,
  };
}