import 'dart:io';

class RegisterBody {
  String? countryId;
  String? name;
  String? phone;
  String? governmentId;
  String? cityId;
  String? areaId;
  String? gender;
  String? email;
  String? birthdate;
  String? type;
  String? password;
  String? address;
  String? latitude;
  String? longitude;
  File? image;
  File? commercialRegistration;

  RegisterBody({
    this.countryId,
    this.name,
    this.phone,
    this.governmentId,
    this.cityId,
    this.areaId,
    this.gender,
    this.email,
    this.birthdate,
    this.type,
    this.password,
    this.address,
    this.latitude,
    this.longitude,
    this.image,
    this.commercialRegistration,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
        countryId: json["country_id"],
        name: json["name"],
        governmentId: json["government_id"],
        cityId: json["city_id"],
        areaId: json["area_id"],
        phone: json["phone"],
        gender: json["gender"],
        email: json["email"],
        birthdate: json["birthdate"],
        type: json["type"],
        password: json["password"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        image: json["image"],
        commercialRegistration: json["commercial_registration"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "government_id": governmentId,
        "city_id": cityId,
        "area_id": areaId,
        "phone": phone,
        "name": name,
        "gender": gender,
        "email": email,
        "birthdate": birthdate,
        "type": type,
        "password": password,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "image": image,
        "commercial_registration": commercialRegistration,
      };
}
