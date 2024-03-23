
class AssumptionsModel {
  List<Datum>? data;
  List<String>? message;
  int? status;

  AssumptionsModel({
    this.data,
    this.message,
    this.status,
  });

  factory AssumptionsModel.fromJson(Map<String, dynamic> json) => AssumptionsModel(
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
  int? id;
  String? title;
  String? slug;
  String? type;
  String? image;

  Datum({
    this.id,
    this.title,
    this.slug,
    this.type,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    type: json["type"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "type": type,
    "image": image,
  };
}
