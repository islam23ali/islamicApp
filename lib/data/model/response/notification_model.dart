
class NotificationModel {
  List<Datum>? data;
  List<String>? message;
  int? status;

  NotificationModel({
    this.data,
    this.message,
    this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
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
  String? body;

  Datum({
    this.id,
    this.title,
    this.body,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
  };
}
