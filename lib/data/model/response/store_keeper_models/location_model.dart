
class LocationModel {
  int? code;
  List<Datum>? data;
  String? message;

  LocationModel({
    this.code,
    this.data,
    this.message,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
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
  String? name;
  String? logo;
  String? liveLink;
  String? type;
  String? createdAt;

  Datum({
    this.id,
    this.name,
    this.logo,
    this.liveLink,
    this.type,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    liveLink: json["live_link"],
    type: json["type"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "live_link": liveLink,
    "type": type,
    "created_at": createdAt,
  };
}
