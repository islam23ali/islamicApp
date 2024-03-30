
class TitlePagesModel {
  Data? data;
  List<String>? message;
  int? status;

  TitlePagesModel({
    this.data,
    this.message,
    this.status,
  });

  factory TitlePagesModel.fromJson(Map<String, dynamic> json) => TitlePagesModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
  status: json["status"],
  );

  Map<String, dynamic> toJson() => {
  "data": data?.toJson(),
  "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
  "status": status,
};
}

class Data {
  DateTime? date;
  String? title;
  String? body;

  Data({
    this.date,
    this.title,
    this.body,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "title": title,
    "body": body,
  };
}
