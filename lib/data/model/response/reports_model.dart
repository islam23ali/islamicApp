
class ReportsModel {
  Data? data;
  List<String>? message;
  int? status;

  ReportsModel({
    this.data,
    this.message,
    this.status,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
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
  List<Analysis>? goodDeedAnalysis;
  List<Analysis>? assumptionAnalysis;
  List<Analysis>? sunnahAnalysis;

  Data({
    this.goodDeedAnalysis,
    this.assumptionAnalysis,
    this.sunnahAnalysis,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      goodDeedAnalysis: json["good_deed_analysis"] == null ? [] : List<Analysis>.from(json["good_deed_analysis"]!.map((x) => Analysis.fromJson(x))),
  assumptionAnalysis: json["assumption_analysis"] == null ? [] : List<Analysis>.from(json["assumption_analysis"]!.map((x) => Analysis.fromJson(x))),
  sunnahAnalysis: json["sunnah_analysis"] == null ? [] : List<Analysis>.from(json["sunnah_analysis"]!.map((x) => Analysis.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "good_deed_analysis": goodDeedAnalysis == null ? [] : List<dynamic>.from(goodDeedAnalysis!.map((x) => x.toJson())),
  "assumption_analysis": assumptionAnalysis == null ? [] : List<dynamic>.from(assumptionAnalysis!.map((x) => x.toJson())),
  "sunnah_analysis": sunnahAnalysis == null ? [] : List<dynamic>.from(sunnahAnalysis!.map((x) => x.toJson())),
};
}

class Analysis {
  String? title;
  dynamic percentage;

  Analysis({
    this.title,
    this.percentage,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) => Analysis(
    title: json["title"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "percentage": percentage,
  };
}
