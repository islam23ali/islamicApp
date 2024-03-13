import 'package:islamic_app/data/model/response/user_model.dart';

class ReportModel {
  int? id;
  String? type;
  int? userId;
  User? user;
  int? reportId;
  String? date;
  String? createdAt;

  ReportModel({
    this.id,
    this.type,
    this.userId,
    this.user,
    this.reportId,
    this.date,
    this.createdAt,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    id: json["id"],
    type: json["type"],
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    reportId: json["report_id"],
    date: json["date"] == null ? null : json["date"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "user_id": userId,
    "user": user?.toJson(),
    "report_id": reportId,
    "date": date,
    "created_at": createdAt,
  };
}

