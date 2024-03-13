import 'package:islamic_app/data/model/response/charity_model.dart';
import 'package:islamic_app/data/model/response/user_model.dart';

class OrderModel {
  int? id;
  String? code;
  String? type;
  int? charityId;
  CharityModel? charity;
  dynamic receiptUserId;
  dynamic receiptUser;
  int? driverId;
  User? driver;
  int? storeOwnerId;
  User? storeOwner;
  int? storeId;
  Store? store;
  int? locationId;
  CharityModel? location;
  String? notes;
  int? mealCount;
  int? waterCount;
  int? confirmMealCount;
  int? confirmWaterCount;
  bool? signatureDelivered;
  bool? signatureReceipt;
  String? status;
  dynamic date;
  String? createdAt;

  OrderModel({
    this.id,
    this.code,
    this.type,
    this.charityId,
    this.charity,
    this.receiptUserId,
    this.receiptUser,
    this.driverId,
    this.driver,
    this.storeOwnerId,
    this.storeOwner,
    this.storeId,
    this.store,
    this.locationId,
    this.location,
    this.notes,
    this.mealCount,
    this.waterCount,
    this.confirmMealCount,
    this.confirmWaterCount,
    this.signatureDelivered,
    this.signatureReceipt,
    this.status,
    this.date,
    this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    code: json["code"],
    type: json["type"],
    charityId: json["charity_id"],
    charity: json["charity"] == null ? null : CharityModel.fromJson(json["charity"]),
    receiptUserId: json["receipt_user_id"],
    receiptUser: json["receipt_user"],
    driverId: json["driver_id"],
    driver: json["driver"] == null ? null : User.fromJson(json["driver"]),
    storeOwnerId: json["store_owner_id"],
    storeOwner: json["store_owner"] == null ? null : User.fromJson(json["store_owner"]),
    storeId: json["store_id"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
    locationId: json["location_id"],
    location: json["location"] == null ? null : CharityModel.fromJson(json["location"]),
    notes: json["notes"],
    mealCount: json["meal_count"],
    waterCount: json["water_count"],
    confirmMealCount: json["confirm_meal_count"],
    confirmWaterCount: json["confirm_water_count"],
    signatureDelivered: json["signature_delivered"],
    signatureReceipt: json["signature_receipt"],
    status: json["status"],
    date: json["date"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "type": type,
    "charity_id": charityId,
    "charity": charity?.toJson(),
    "receipt_user_id": receiptUserId,
    "receipt_user": receiptUser,
    "driver_id": driverId,
    "driver": driver?.toJson(),
    "store_owner_id": storeOwnerId,
    "store_owner": storeOwner?.toJson(),
    "store_id": storeId,
    "store": store?.toJson(),
    "location_id": locationId,
    "location": location?.toJson(),
    "notes": notes,
    "meal_count": mealCount,
    "water_count": waterCount,
    "confirm_meal_count": confirmMealCount,
    "confirm_water_count": confirmWaterCount,
    "signature_delivered": signatureDelivered,
    "signature_receipt": signatureReceipt,
    "status": status,
    "date": date,
    "created_at": createdAt,
  };
}