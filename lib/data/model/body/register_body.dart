
class RegisterBody {
  String? name;
  String? email;
  String? phone;
  String? password;


  RegisterBody({
    this.name,
    this.email,
    this.phone,
    this.password,

  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) => RegisterBody(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,

  };
}
