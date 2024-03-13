import 'dart:io';

class UpdateProfileBody  {
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  File? image;


  UpdateProfileBody({
    this.firstName,
    this.phoneCode,
    this.phone,
    this.lastName,
    this.image,
  });

  factory UpdateProfileBody.fromJson(Map<String, dynamic> json) => UpdateProfileBody(
    firstName: json["first_name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    lastName: json["last_name"],
     image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "phone_code": phoneCode,
    "phone": phone,
    "last_name": lastName,
     "image": image,
  };
}
