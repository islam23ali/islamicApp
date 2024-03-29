
class AnalysisModel {
  List<Datum>? data;
  List<String>? message;
  int? status;

  AnalysisModel({
    this.data,
    this.message,
    this.status,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) => AnalysisModel(
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
  status: json["status"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
  "status": status,
};
}

class Datum {
  String? title;
  dynamic dayAssumptionPercentage;
  dynamic daySunnahPercentage;
  dynamic weekAssumptionPercentage;
  dynamic weekSunnahPercentage;
  dynamic allAssumptionPercentage;
  dynamic allSunnahPercentage;

  Datum({
    this.title,
    this.dayAssumptionPercentage,
    this.daySunnahPercentage,
    this.weekAssumptionPercentage,
    this.weekSunnahPercentage,
    this.allAssumptionPercentage,
    this.allSunnahPercentage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    dayAssumptionPercentage: json["day_assumption_percentage"],
    daySunnahPercentage: json["day_sunnah_percentage"],
    weekAssumptionPercentage: json["week_assumption_percentage"],
    weekSunnahPercentage: json["week_sunnah_percentage"],
    allAssumptionPercentage: json["all_assumption_percentage"],
    allSunnahPercentage: json["all_sunnah_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "day_assumption_percentage": dayAssumptionPercentage,
    "day_sunnah_percentage": daySunnahPercentage,
    "week_assumption_percentage": weekAssumptionPercentage,
    "week_sunnah_percentage": weekSunnahPercentage,
    "all_assumption_percentage": allAssumptionPercentage,
    "all_sunnah_percentage": allSunnahPercentage,
  };
}
