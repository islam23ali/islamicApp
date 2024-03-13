
class FavoriteSportsModel {
  int? code;
  List<OneFavoriteSport>? data;
  String? message;

  FavoriteSportsModel({
    this.code,
    this.data,
    this.message,
  });

  factory FavoriteSportsModel.fromJson(Map<String, dynamic> json) => FavoriteSportsModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<OneFavoriteSport>.from(json["data"]!.map((x) => OneFavoriteSport.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class OneFavoriteSport {
  int? id;
  String? title;
  String? image;

  OneFavoriteSport({
    this.id,
    this.title,
    this.image,
  });

  factory OneFavoriteSport.fromJson(Map<String, dynamic> json) => OneFavoriteSport(
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
