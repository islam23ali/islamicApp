

class StatusResponse {
  int? code;
  String? message;

  StatusResponse({
    this.code,
    this.message,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}

