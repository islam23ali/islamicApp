
class DeliveryOrderBody {
  String? charityId;
  String? driverId;
  String? locationId;
  String? mealCount;
  String? waterCount;
  String? date;


  DeliveryOrderBody({
    this.charityId,
    this.driverId,
    this.locationId,
    this.mealCount,
    this.waterCount,
    this.date,

  });

  factory DeliveryOrderBody.fromJson(Map<String, dynamic> json) => DeliveryOrderBody(
    charityId: json["charity_id"],
    driverId: json["driver_id"],
    locationId: json["location_id"],
    mealCount: json["meal_count"],
    waterCount: json["water_count"],
    date: json["date"],

  );

  Map<String, dynamic> toJson() => {
    "charity_id": charityId,
    "driver_id": driverId,
    "location_id": locationId,
    "meal_count": mealCount,
    "water_count": waterCount,
    "date": date,
  };
}
