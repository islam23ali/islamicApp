
class PrayersModel {
  List<OnePrayes>? data;
  List<String>? message;
  int? status;

  PrayersModel({
    this.data,
    this.message,
    this.status,
  });

  factory PrayersModel.fromJson(Map<String, dynamic> json) => PrayersModel(
      data: json["data"] == null ? [] : List<OnePrayes>.from(json["data"]!.map((x) => OnePrayes.fromJson(x))),
  message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
  status: json["status"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
  "status": status,
};
}

class OnePrayes {
  int? id;
  String? title;
  String? slug;
  String? time;
  String? image;
  int? group;
  int? individually;
  int? late;
  int? nawafel;

  OnePrayes({
    this.id,
    this.title,
    this.slug,
    this.time,
    this.image,
    this.group,
    this.individually,
    this.late,
    this.nawafel,
  });

  factory OnePrayes.fromJson(Map<String, dynamic> json) => OnePrayes(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    time: json["time"],
    image: json["image"],
    group: json["group"],
    individually: json["individually"],
    late: json["late"],
    nawafel: json["nawafel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "time": time,
    "image": image,
    "group": group,
    "individually": individually,
    "late": late,
    "nawafel": nawafel,
  };
}
