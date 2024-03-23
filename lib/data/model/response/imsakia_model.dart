
class ImsakiaModel {
  Data? data;
  List<String>? message;
  int? status;

  ImsakiaModel({
    this.data,
    this.message,
    this.status,
  });

  factory ImsakiaModel.fromJson(Map<String, dynamic> json) => ImsakiaModel(
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
  String? ramadanSchedule;

  Data({
    this.ramadanSchedule,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ramadanSchedule: json["ramadan_schedule"],
  );

  Map<String, dynamic> toJson() => {
    "ramadan_schedule": ramadanSchedule,
  };
}
