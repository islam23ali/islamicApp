
class LoginBody {
  String? username;
  String? password;


  LoginBody({
    this.username,
    this.password,

  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
    username: json["username"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,

  };
}
