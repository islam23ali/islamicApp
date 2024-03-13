
class CaptainModel {
  int? code;
  List<Datum>? data;
  String? message;

  CaptainModel({
    this.code,
    this.data,
    this.message,
  });

  factory CaptainModel.fromJson(Map<String, dynamic> json) => CaptainModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int? id;
  String? name;
  String? type;
  String? email;
  String? signatureImage;
  String? username;
  dynamic userCharity;
  dynamic userStore;
  String? token;

  Datum({
    this.id,
    this.name,
    this.type,
    this.email,
    this.signatureImage,
    this.username,
    this.userCharity,
    this.userStore,
    this.token,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    signatureImage: json["signature_image"],
    username: json["username"],
    userCharity: json["user_charity"],
    userStore: json["user_store"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "signature_image": signatureImage,
    "username": username,
    "user_charity": userCharity,
    "user_store": userStore,
    "token": token,
  };
}
