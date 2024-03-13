
class FantasticReservationModel {
  int? code;
  List<OneReservation>? data;
  String? message;

  FantasticReservationModel({
    this.code,
    this.data,
    this.message,
  });

  factory FantasticReservationModel.fromJson(Map<String, dynamic> json) => FantasticReservationModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<OneReservation>.from(json["data"]!.map((x) => OneReservation.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class OneReservation {
  int? id;
  String? reservationTypeKey;
  int? sportId;
  String? sportTitle;
  int? playgroundId;
  String? date;
  String? hoursCount;
  String? totalPrice;
  String? totalNightPlus;
  String? grandTotal;
  bool? fullPaid;
  int? userId;
  String? userName;
  String? status;
  String? fromHour;
  String? toHour;
  String? hourRangeArabic;
  String? hourRangeEnglish;
  int? remainingPlayers;
  String? createdAt;
  Playground? playground;
  Details? details;

  OneReservation({
    this.id,
    this.reservationTypeKey,
    this.sportId,
    this.sportTitle,
    this.playgroundId,
    this.date,
    this.hoursCount,
    this.totalPrice,
    this.totalNightPlus,
    this.grandTotal,
    this.fullPaid,
    this.userId,
    this.userName,
    this.status,
    this.fromHour,
    this.toHour,
    this.hourRangeArabic,
    this.hourRangeEnglish,
    this.remainingPlayers,
    this.createdAt,
    this.playground,
    this.details,
  });

  factory OneReservation.fromJson(Map<String, dynamic> json) => OneReservation(
    id: json["id"],
    reservationTypeKey: json["reservation_type_key"],
    sportId: json["sport_id"],
    sportTitle: json["sport_title"],
    playgroundId: json["playground_id"],
    date: json["date"] ,
    hoursCount: json["hours_count"],
    totalPrice: json["total_price"],
    totalNightPlus: json["total_night_plus"],
    grandTotal: json["grand_total"],
    fullPaid: json["full_paid"],
    userId: json["user_id"],
    userName: json["user_name"],
    status: json["status"],
    fromHour: json["from_hour"],
    toHour: json["to_hour"],
    hourRangeArabic: json["hour_range_arabic"],
    hourRangeEnglish: json["hour_range_english"],
    remainingPlayers: json["remaining_players"],
    createdAt: json["created_at"],
    playground: json["playground"] == null ? null : Playground.fromJson(json["playground"]),
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reservation_type_key": reservationTypeKey,
    "sport_id": sportId,
    "sport_title": sportTitle,
    "playground_id": playgroundId,
    "date": date,
    "hours_count": hoursCount,
    "total_price": totalPrice,
    "total_night_plus": totalNightPlus,
    "grand_total": grandTotal,
    "full_paid": fullPaid,
    "user_id": userId,
    "user_name": userName,
    "status": status,
    "from_hour": fromHour,
    "to_hour": toHour,
    "hour_range_arabic": hourRangeArabic,
    "hour_range_english": hourRangeEnglish,
    "remaining_players": remainingPlayers,
    "created_at": createdAt,
    "playground": playground?.toJson(),
    "details": details?.toJson(),
  };
}

class Details {
  int? id;
  int? reservationTypeId;
  int? reservationId;
  String? numberOfTeam;
  String? minTeamNumber;
  String? teamPrice;
  String? personPrice;
  String? totalPlayers;

  Details({
    this.id,
    this.reservationTypeId,
    this.reservationId,
    this.numberOfTeam,
    this.minTeamNumber,
    this.teamPrice,
    this.personPrice,
    this.totalPlayers,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    reservationTypeId: json["reservation_type_id"],
    reservationId: json["reservation_id"],
    numberOfTeam: json["number_of_team"],
    minTeamNumber: json["min_team_number"],
    teamPrice: json["team_price"],
    personPrice: json["person_price"],
    totalPlayers: json["total_players"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reservation_type_id": reservationTypeId,
    "reservation_id": reservationId,
    "number_of_team": numberOfTeam,
    "min_team_number": minTeamNumber,
    "team_price": teamPrice,
    "person_price": personPrice,
    "total_players": totalPlayers,
  };
}

class Playground {
  int? id;
  String? image;
  String? title;
  String? rate;
  String? address;
  String? longitude;
  String? latitude;
  int? distance;

  Playground({
    this.id,
    this.image,
    this.title,
    this.rate,
    this.address,
    this.longitude,
    this.latitude,
    this.distance,
  });

  factory Playground.fromJson(Map<String, dynamic> json) => Playground(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    rate: json["rate"],
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "rate": rate,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "distance": distance,
  };
}
