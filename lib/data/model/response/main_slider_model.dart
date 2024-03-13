
class MainSliderModel {
  int? code;
  List<Datum>? data;
  String? message;

  MainSliderModel({
    this.code,
    this.data,
    this.message,
  });

  factory MainSliderModel.fromJson(Map<String, dynamic> json) => MainSliderModel(
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
  String? image;

  Datum({
    this.id,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}
