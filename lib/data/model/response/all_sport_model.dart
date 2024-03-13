
class AllSportsModel {
  int? code;
  List<Datum>? data;
  String? message;

  AllSportsModel({
    this.code,
    this.data,
    this.message,
  });

  factory AllSportsModel.fromJson(Map<String, dynamic> json) => AllSportsModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int? id;
  String? title;
  String? image;

  Datum({
    this.id,
    this.title,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
