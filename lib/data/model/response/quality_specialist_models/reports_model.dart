
class ReportsModel {
  String? message;
  int? code;
  List<OneReport>? data;

  ReportsModel({
    this.message,
    this.code,
    this.data,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<OneReport>.from(json["data"]!.map((x) => OneReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OneReport {
  String? type;
  int? userId;
  User? user;
  int? reportId;
  DateTime? date;
  dynamic notes;
  String? createdAt;

  OneReport({
    this.type,
    this.userId,
    this.user,
    this.reportId,
    this.date,
    this.notes,
    this.createdAt,
  });

  factory OneReport.fromJson(Map<String, dynamic> json) => OneReport(
    type: json["type"],
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    reportId: json["report_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    notes: json["notes"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "user_id": userId,
    "user": user?.toJson(),
    "report_id": reportId,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "notes": notes,
    "created_at": createdAt,
  };
}

class User {
  int? id;
  String? name;
  String? type;
  String? email;
  String? signatureImage;
  String? username;
  UserCharity? userCharity;
  UserStore? userStore;
  String? token;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    signatureImage: json["signature_image"],
    username: json["username"],
    userCharity: json["user_charity"] == null ? null : UserCharity.fromJson(json["user_charity"]),
    userStore: json["user_store"] == null ? null : UserStore.fromJson(json["user_store"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "signature_image": signatureImage,
    "username": username,
    "user_charity": userCharity?.toJson(),
    "user_store": userStore?.toJson(),
    "token": token,
  };
}

class UserCharity {
  int? id;
  String? charityId;
  Charity? charity;

  UserCharity({
    this.id,
    this.charityId,
    this.charity,
  });

  factory UserCharity.fromJson(Map<String, dynamic> json) => UserCharity(
    id: json["id"],
    charityId: json["charity_id"],
    charity: json["charity"] == null ? null : Charity.fromJson(json["charity"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "charity_id": charityId,
    "charity": charity?.toJson(),
  };
}

class Charity {
  int? id;
  String? name;
  String? logo;
  String? liveLink;
  String? type;
  String? createdAt;

  Charity({
    this.id,
    this.name,
    this.logo,
    this.liveLink,
    this.type,
    this.createdAt,
  });

  factory Charity.fromJson(Map<String, dynamic> json) => Charity(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    liveLink: json["live_link"],
    type: json["type"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "live_link": liveLink,
    "type": type,
    "created_at": createdAt,
  };
}

class UserStore {
  int? id;
  int? storeId;
  Store? store;

  UserStore({
    this.id,
    this.storeId,
    this.store,
  });

  factory UserStore.fromJson(Map<String, dynamic> json) => UserStore(
    id: json["id"],
    storeId: json["store_id"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "store": store?.toJson(),
  };
}

class Store {
  int? id;
  String? name;

  Store({
    this.id,
    this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
