
class NextPrayerModel {
  Data? data;
  List<String>? message;
  int? status;

  NextPrayerModel({
    this.data,
    this.message,
    this.status,
  });

  factory NextPrayerModel.fromJson(Map<String, dynamic> json) => NextPrayerModel(
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
  String? text;

  Data({
    this.date,
    this.title,
    this.text,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    title: json["title"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "title": title,
    "text": text,
  };
}
