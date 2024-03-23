
class SupplicationsDetailsModel {
  List<Datum>? data;
  List<String>? message;
  int? status;

  SupplicationsDetailsModel({
    this.data,
    this.message,
    this.status,
  });

  factory SupplicationsDetailsModel.fromJson(Map<String, dynamic> json) => SupplicationsDetailsModel(
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
  String? text;

  Datum({
    this.id,
    this.text,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };
}
