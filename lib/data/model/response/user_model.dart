
class UserModel {
  Data? data;
  List<String>? message;
  int? status;

  UserModel({
    this.data,
    this.message,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  int? id;
  String? name;
  String? email;
  String? phone;
  String? token;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "token": token,
  };
}
