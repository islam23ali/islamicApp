
class PrayersModel {
  List<OnePraye>? data;
  List<String>? message;
  int? status;

  PrayersModel({
    this.data,
    this.message,
    this.status,
  });

  factory PrayersModel.fromJson(Map<String, dynamic> json) => PrayersModel(
      data: json["data"] == null ? [] : List<OnePraye>.from(json["data"]!.map((x) => OnePraye.fromJson(x))),
  message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
  status: json["status"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
  "status": status,
};
}

class OnePraye {
  int? id;
  String? title;
  String? slug;

  OnePraye({
    this.id,
    this.title,
    this.slug,
  });

  factory OnePraye.fromJson(Map<String, dynamic> json) => OnePraye(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
  };
}
