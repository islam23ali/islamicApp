
class CountriesModel {
  int code;
  List<Datum> data;
  String message;

  CountriesModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int id;
  String logo;
  String title;
  String currency;
  String code;

  Datum({
    required this.id,
    required this.logo,
    required this.title,
    required this.currency,
    required this.code,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    logo: json["logo"],
    title: json["title"],
    currency: json["currency"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "title": title,
    "currency": currency,
    "code": code,
  };
}
