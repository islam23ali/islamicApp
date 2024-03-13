
class PlaygroundsModel {
  int? code;
  String? message;
  List<OnePlayground>? data;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  PlaygroundsModel({
    this.code,
    this.message,
    this.data,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory PlaygroundsModel.fromJson(Map<String, dynamic> json) => PlaygroundsModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<OnePlayground>.from(json["data"]!.map((x) => OnePlayground.fromJson(x))),
    currentPage: json["current_page"],
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "current_page": currentPage,
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class OnePlayground {
  int? id;
  int? providerId;
  String? title;
  String? address;
  String? commercialRegistration;
  String? longitude;
  String? latitude;
  int? distance;
  int? sportId;
  String? sportTitle;
  String? maxTeamNumber;
  String? morningStartHour;
  String? morningEndHour;
  String? nightStartHour;
  String? nightEndHour;
  String? hourPrice;
  String? nightPlusPrice;
  String? image;
  String? rate;
  int? ratesCount;
  List<Rate>? rates;
  List<Service>? services;

  OnePlayground({
    this.id,
    this.providerId,
    this.title,
    this.address,
    this.commercialRegistration,
    this.longitude,
    this.latitude,
    this.distance,
    this.sportId,
    this.sportTitle,
    this.maxTeamNumber,
    this.morningStartHour,
    this.morningEndHour,
    this.nightStartHour,
    this.nightEndHour,
    this.hourPrice,
    this.nightPlusPrice,
    this.image,
    this.rate,
    this.ratesCount,
    this.rates,
    this.services,
  });

  factory OnePlayground.fromJson(Map<String, dynamic> json) => OnePlayground(
    id: json["id"],
    providerId: json["provider_id"],
    title: json["title"],
    address: json["address"],
    commercialRegistration: json["commercial_registration"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    distance: json["distance"],
    sportId: json["sport_id"],
    sportTitle: json["sport_title"],
    maxTeamNumber: json["max_team_number"],
    morningStartHour: json["morning_start_hour"],
    morningEndHour: json["morning_end_hour"],
    nightStartHour: json["night_start_hour"],
    nightEndHour: json["night_end_hour"],
    hourPrice: json["hour_price"],
    nightPlusPrice: json["night_plus_price"],
    image: json["image"],
    rate: json["rate"],
    ratesCount: json["ratesCount"],
    rates: json["rates"] == null ? [] : List<Rate>.from(json["rates"]!.map((x) => Rate.fromJson(x))),
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_id": providerId,
    "title": title,
    "address": address,
    "commercial_registration": commercialRegistration,
    "longitude": longitude,
    "latitude": latitude,
    "sport_id": sportId,
    "distance": distance,
    "sport_title": sportTitle,
    "max_team_number": maxTeamNumber,
    "morning_start_hour": morningStartHour,
    "morning_end_hour": morningEndHour,
    "night_start_hour": nightStartHour,
    "night_end_hour": nightEndHour,
    "hour_price": hourPrice,
    "night_plus_price": nightPlusPrice,
    "image": image,
    "rate": rate,
    "ratesCount": ratesCount,
    "rates": rates == null ? [] : List<dynamic>.from(rates!.map((x) => x.toJson())),
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class Rate {
  int? id;
  int? playgroundId;
  int? userId;
  String? rate;
  String? userName;
  String? comment;
  String? createdAt;

  Rate({
    this.id,
    this.playgroundId,
    this.userId,
    this.rate,
    this.userName,
    this.comment,
    this.createdAt,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    id: json["id"],
    playgroundId: json["playground_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    rate: json["rate"],
    comment: json["comment"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "playground_id": playgroundId,
    "user_id": userId,
    "rate": rate,
    "user_name": userName,
    "comment": comment,
    "created_at": createdAt,
  };
}
class Service {
  int? id;
  String? image;
  String? title;

  Service({
    this.id,
    this.image,
    this.title,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    image: json["image"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
  };
}
