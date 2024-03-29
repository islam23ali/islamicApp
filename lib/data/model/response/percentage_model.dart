
class PercentageModel {
  Data? data;
  List<String>? message;
  int? status;

  PercentageModel({
    this.data,
    this.message,
    this.status,
  });

  factory PercentageModel.fromJson(Map<String, dynamic> json) => PercentageModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
  status: json["status"],
  );

  Map<String, dynamic> toJson() => {
  "data": data?.toJson(),
  "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
  "status": status,
};
}

class Data {
  dynamic dayAssumptionPercentage;
  dynamic weekAssumptionPercentage;
  dynamic allAssumptionPercentage;
  dynamic daySunnahPercentage;
  dynamic weekSunnahPercentage;
  dynamic allSunnahPercentage;

  Data({
    this.dayAssumptionPercentage,
    this.weekAssumptionPercentage,
    this.allAssumptionPercentage,
    this.daySunnahPercentage,
    this.weekSunnahPercentage,
    this.allSunnahPercentage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dayAssumptionPercentage: json["day_assumption_percentage"],
    weekAssumptionPercentage: json["week_assumption_percentage"],
    allAssumptionPercentage: json["all_assumption_percentage"],
    daySunnahPercentage: json["day_sunnah_percentage"],
    weekSunnahPercentage: json["week_sunnah_percentage"],
    allSunnahPercentage: json["all_sunnah_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "day_assumption_percentage": dayAssumptionPercentage,
    "week_assumption_percentage": weekAssumptionPercentage,
    "all_assumption_percentage": allAssumptionPercentage,
    "day_sunnah_percentage": daySunnahPercentage,
    "week_sunnah_percentage": weekSunnahPercentage,
    "all_sunnah_percentage": allSunnahPercentage,
  };
}
