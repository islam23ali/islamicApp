
import '../charity_model.dart';

class CharitiesOrderModel {
  int? code;
  List<Datum>? data;
  String? message;

  CharitiesOrderModel({
    this.code,
    this.data,
    this.message,
  });

  factory CharitiesOrderModel.fromJson(Map<String, dynamic> json) => CharitiesOrderModel(
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
  int? charityId;
  CharityModel? charity;
  int? charityOwnerId;
  dynamic charityOwner;
  int? mealCount;
  int? waterCount;
  num? receivedMealCount;

  Datum({
    this.id,
    this.charityId,
    this.charity,
    this.charityOwnerId,
    this.charityOwner,
    this.mealCount,
    this.waterCount,
    this.receivedMealCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    charityId: json["charity_id"],
    charity: json["charity"] == null ? null : CharityModel.fromJson(json["charity"]),
    charityOwnerId: json["charity_owner_id"],
    charityOwner: json["charity_owner"],
    mealCount: json["meal_count"],
    waterCount: json["water_count"],
    receivedMealCount: json["received_meal_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "charity_id": charityId,
    "charity": charity?.toJson(),
    "charity_owner_id": charityOwnerId,
    "charity_owner": charityOwner,
    "meal_count": mealCount,
    "water_count": waterCount,
    "received_meal_count": receivedMealCount,
  };
}

// class Charity {
//   int? id;
//   String? name;
//   String? logo;
//   String? liveLink;
//   String? type;
//   String? createdAt;
//
//   Charity({
//     this.id,
//     this.name,
//     this.logo,
//     this.liveLink,
//     this.type,
//     this.createdAt,
//   });
//
//   factory Charity.fromJson(Map<String, dynamic> json) => Charity(
//     id: json["id"],
//     name: json["name"],
//     logo: json["logo"],
//     liveLink: json["live_link"],
//     type: json["type"],
//     createdAt: json["created_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "logo": logo,
//     "live_link": liveLink,
//     "type": type,
//     "created_at": createdAt,
//   };
// }
