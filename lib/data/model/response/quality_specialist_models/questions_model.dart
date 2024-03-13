
class QuestionsModel {
  int? code;
  List<Datum>? data;
  String? message;

  QuestionsModel({
    this.code,
    this.data,
    this.message,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int? id;
  String? name;
  String? type;
  List<Answer>? answers;

  Datum({
    this.id,
    this.name,
    this.type,
    this.answers,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
  };
}

class Answer {
  int? id;
  String? value;
  String? color;
  int isSelected=0;

  Answer({
    this.id,
    this.value,
    this.color,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json["id"],
    value: json["value"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "color": color,
  };
}
