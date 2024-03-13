
import 'package:islamic_app/data/model/response/charity_model.dart';

class UserModel {
  int? code;
  User? data;
  String? message;

  UserModel({
    this.code,
    this.data,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    code: json["code"],
    data: json["data"] == null ? null : User.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

class User {
  int? id;
  String? name;
  String? type;
  String? email;
  dynamic username;
  UserCharity? userCharity;
  UserStore? userStore;
  String? signature_image;
  String? token;

  User({
    this.id,
    this.name,
    this.type,
    this.email,
    this.username,
    this.userCharity,
    this.userStore,
    this.signature_image,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    username: json["username"],
    signature_image: json["signature_image"],
    userStore: json["user_store"] == null ? UserStore() : UserStore.fromJson(json["user_store"]),
    userCharity: json["user_charity"] == null ? UserCharity() : UserCharity.fromJson(json["user_charity"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "username": username,
    "signature_image": signature_image,
    "user_charity": userCharity!.toJson(),
    "user_store": userStore?.toJson(),
    "token": token,
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
class UserCharity {
  int? id;
  String? charityId;
  CharityModel? charity;

  UserCharity({
    this.id,
    this.charityId,
    this.charity,
  });

  factory UserCharity.fromJson(Map<String, dynamic> json) => UserCharity(
    id: json["id"],
    charityId: json["charity_id"],
    charity: json["charity"] == null ? null : CharityModel.fromJson(json["charity"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "charity_id": charityId,
    "charity": charity?.toJson(),
  };
}