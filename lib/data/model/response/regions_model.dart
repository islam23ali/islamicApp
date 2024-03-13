
class RegionsModel {
  int code;
  List<Datum> data;
  String message;

  RegionsModel({
    required this.code,
    required this.data,
    required this.message,
  });

  factory RegionsModel.fromJson(Map<String, dynamic> json) => RegionsModel(
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
  String? parentId;
  String isShow;
  String type;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  List<Datum>? cities;
  List<Translation> translations;
  List<Datum>? area;

  Datum({
    required this.id,
    required this.parentId,
    required this.isShow,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    this.cities,
    required this.translations,
    this.area,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    parentId: json["parent_id"],
    isShow: json["is_show"],
    type: json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    title: json["title"],
    cities: json["cities"] == null ? [] : List<Datum>.from(json["cities"]!.map((x) => Datum.fromJson(x))),
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
    area: json["area"] == null ? [] : List<Datum>.from(json["area"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "is_show": isShow,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "title": title,
    "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x.toJson())),
    "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    "area": area == null ? [] : List<dynamic>.from(area!.map((x) => x.toJson())),
  };
}

class Translation {
  int id;
  String regionId;
  Locale locale;
  String title;
  DateTime? createdAt;
  DateTime? updatedAt;

  Translation({
    required this.id,
    required this.regionId,
    required this.locale,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    regionId: json["region_id"],
    locale: localeValues.map[json["locale"]]!,
    title: json["title"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_id": regionId,
    "locale": localeValues.reverse[locale],
    "title": title,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum Locale {
  AR,
  EN
}

final localeValues = EnumValues({
  "ar": Locale.AR,
  "en": Locale.EN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
