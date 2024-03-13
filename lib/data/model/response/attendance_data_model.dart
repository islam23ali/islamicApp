import 'package:islamic_app/data/model/response/history_signature.dart';
import 'package:islamic_app/data/model/response/user_model.dart';

class AttendaceDataModel {
  int? code;
  AttendanceModel? data;
  String? message;

  AttendaceDataModel({
    this.code,
    this.data,
    this.message,
  });

  factory AttendaceDataModel.fromJson(Map<String, dynamic> json) => AttendaceDataModel(
    code: json["code"],
    data: json["data"] == null ? null : AttendanceModel.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

class AttendanceModel {
  int? id;
  DateTime? date;
  int? managerId;
  User? manager;
  List<AttendanceDetail>? attendanceDetails;
  List<HistorySignature>? historySignature;
int? signatureStep;
  AttendanceModel({
    this.id,
    this.date,
    this.managerId,
    this.manager,
    this.attendanceDetails,
    this.historySignature,
    this.signatureStep
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    managerId: json["manager_id"],
    signatureStep: json["signature_step"],
    manager: json["manager"] == null ? null : User.fromJson(json["manager"]),
    attendanceDetails: json["attendanceDetails"] == null ? [] : List<AttendanceDetail>.from(json["attendanceDetails"]!.map((x) => AttendanceDetail.fromJson(x))),
    historySignature: json["history_signature"] == null ? [] : List<HistorySignature>.from(json["history_signature"]!.map((x) => HistorySignature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "manager_id": managerId,
    "manager": manager?.toJson(),
    "signature_step": signatureStep,
    "attendanceDetails": attendanceDetails == null ? [] : List<dynamic>.from(attendanceDetails!.map((x) => x.toJson())),
    "history_signature": historySignature == null ? [] : List<HistorySignature>.from(historySignature!.map((x) => x.toJson())),
  };
}

class AttendanceDetail {
  int? id;
  int? workerId;
  Worker? worker;
  String? fromTime;
  String? toTime;
  String? status;

  AttendanceDetail({
    this.id,
    this.workerId,
    this.worker,
    this.fromTime,
    this.toTime,
    this.status,
  });

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) => AttendanceDetail(
    id: json["id"],
    workerId: json["worker_id"],
    worker: json["worker"] == null ? null : Worker.fromJson(json["worker"]),
    fromTime: json["from_time"],
    toTime: json["to_time"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "worker_id": workerId,
    "worker": worker?.toJson(),
    "from_time": fromTime,
    "to_time": toTime,
    "status": status,
  };
}

class Worker {
  int? id;
  String? name;
  int? managerId;
  User? manager;

  Worker({
    this.id,
    this.name,
    this.managerId,
    this.manager,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
    id: json["id"],
    name: json["name"],
    managerId: json["manager_id"],
    manager: json["manager"] == null ? null : User.fromJson(json["manager"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "manager_id": managerId,
    "manager": manager?.toJson(),
  };
}



