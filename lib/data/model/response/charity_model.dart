class CharityModel {
  int? id;
  String? name;
  String? logo;
  String? liveLink;
  String? type;
  String? createdAt;

  CharityModel({
    this.id,
    this.name,
    this.logo,
    this.liveLink,
    this.type,
    this.createdAt,
  });

  factory CharityModel.fromJson(Map<String, dynamic> json) => CharityModel(
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