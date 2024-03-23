// To parse this JSON data, do
//
//     final habitsModel = habitsModelFromJson(jsonString);

import 'dart:convert';

HabitsModel habitsModelFromJson(String str) => HabitsModel.fromJson(json.decode(str));

String habitsModelToJson(HabitsModel data) => json.encode(data.toJson());

class HabitsModel {
  Data? data;
  List<String>? message;
  int? status;

  HabitsModel({
    this.data,
    this.message,
    this.status,
  });

  factory HabitsModel.fromJson(Map<String, dynamic> json) => HabitsModel(
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
  List<GoodDeed>? goodDeeds;
  String? title;
  String? text;
  DateTime? date;

  Data({
    this.goodDeeds,
    this.title,
    this.text,
    this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      goodDeeds: json["good_deeds"] == null ? [] : List<GoodDeed>.from(json["good_deeds"]!.map((x) => GoodDeed.fromJson(x))),
  title: json["title"],
  text: json["text"],
  date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
  "good_deeds": goodDeeds == null ? [] : List<dynamic>.from(goodDeeds!.map((x) => x.toJson())),
  "title": title,
  "text": text,
  "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
};
}

class GoodDeed {
  int? id;
  String? title;
  String? slug;
  int? isChecked;
  String? image;

  GoodDeed({
    this.id,
    this.title,
    this.slug,
    this.isChecked,
    this.image,
  });

  factory GoodDeed.fromJson(Map<String, dynamic> json) => GoodDeed(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    isChecked: json["is_checked"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "is_checked": isChecked,
    "image": image,
  };
}
