
class RemembranceDetailsModel {
  List<Datum>? data;
  List<String>? message;
  int? status;

  RemembranceDetailsModel({
    this.data,
    this.message,
    this.status,
  });

  factory RemembranceDetailsModel.fromJson(Map<String, dynamic> json) => RemembranceDetailsModel(
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
  String? text;

  Datum({
    this.id,
    this.title,
    this.text,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "text": text,
  };
}
