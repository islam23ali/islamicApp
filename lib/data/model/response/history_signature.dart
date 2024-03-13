import 'package:islamic_app/data/model/response/user_model.dart';

class HistorySignature {
  int? id;
  int? userId;
  User? user;
  String? date;
  String? type;

  HistorySignature({
    this.id,
    this.userId,
    this.user,
    this.date,
    this.type,
  });

  factory HistorySignature.fromJson(Map<String, dynamic> json) => HistorySignature(
    id: json["id"],
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    date: json["date"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user": user?.toJson(),
    "date": date,
    "type": type,
  };
}
