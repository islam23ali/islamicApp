
import 'package:islamic_app/data/model/response/charity_model.dart';
import 'package:islamic_app/data/model/response/user_model.dart';

import 'history_signature.dart';

class QulityReportDataModel {
  int? code;
  Data? data;
  String? message;

  QulityReportDataModel({
    this.code,
    this.data,
    this.message,
  });

  factory QulityReportDataModel.fromJson(Map<String, dynamic> json) => QulityReportDataModel(
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  int? id;
  String? type;
  int? charityId;
  CharityModel? charity;
  int? signatureStep;

  int? createdId;
  User? supervisor;
  int? relatedById;
  dynamic relatedBy;
  DateTime? date;
  String? note;
  List<FeedbackDetail>? feedbackDetail;
  List<HistorySignature>? historySignature;
  String? createdAt;

  Data({
    this.id,
    this.type,
    this.charityId,
    this.charity,
    this.createdId,
    this.supervisor,
    this.signatureStep,
    this.relatedById,
    this.relatedBy,
    this.date,
    this.note,
    this.feedbackDetail,
    this.historySignature,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    type: json["type"],
    charityId: json["charity_id"],
    charity: json["charity"] == null ? null : CharityModel.fromJson(json["charity"]),
    createdId: json["created_id"],
    supervisor: json["supervisor"] == null ? null : User.fromJson(json["supervisor"]),
    relatedById: json["related_by_id"],
    relatedBy: json["related_by"],
    signatureStep: json["signature_step"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    note: json["note"],
    feedbackDetail: json["feedbackDetail"] == null ? [] : List<FeedbackDetail>.from(json["feedbackDetail"]!.map((x) => FeedbackDetail.fromJson(x))),
    historySignature: json["history_signature"] == null ? [] : List<HistorySignature>.from(json["history_signature"]!.map((x) => HistorySignature.fromJson(x))),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "charity_id": charityId,
    "charity": charity?.toJson(),
    "created_id": createdId,
    "supervisor": supervisor?.toJson(),
    "related_by_id": relatedById,
    "related_by": relatedBy,
    "signature_step": signatureStep,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "note": note,
    "feedbackDetail": feedbackDetail == null ? [] : List<dynamic>.from(feedbackDetail!.map((x) => x.toJson())),
    "history_signature": historySignature == null ? [] : List<HistorySignature>.from(historySignature!.map((x) => x.toJson())),
    "created_at": createdAt,
  };
}


class FeedbackDetail {
  int? id;
  int? questionsAnswerId;
  QuestionsAnswer? questionsAnswer;
  String? questionsAnswerValue;

  FeedbackDetail({
    this.id,
    this.questionsAnswerId,
    this.questionsAnswer,
    this.questionsAnswerValue,
  });

  factory FeedbackDetail.fromJson(Map<String, dynamic> json) => FeedbackDetail(
    id: json["id"],
    questionsAnswerId: json["questions_answer_id"],
    questionsAnswer: json["questions_answer"] == null ? null : QuestionsAnswer.fromJson(json["questions_answer"]),
    questionsAnswerValue: json["questions_answer_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "questions_answer_id": questionsAnswerId,
    "questions_answer": questionsAnswer?.toJson(),
    "questions_answer_value": questionsAnswerValue,
  };
}

class QuestionsAnswer {
  int? id;
  int? questionId;
  Question? question;
  String? value;
  String? color;

  QuestionsAnswer({
    this.id,
    this.questionId,
    this.question,
    this.value,
    this.color,
  });

  factory QuestionsAnswer.fromJson(Map<String, dynamic> json) => QuestionsAnswer(
    id: json["id"],
    questionId: json["question_id"],
    question: json["question"] == null ? null : Question.fromJson(json["question"]),
    value: json["value"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question_id": questionId,
    "question": question?.toJson(),
    "value": value,
    "color": color,
  };
}

class Question {
  int? id;
  String? name;
  String? type;
  List<Answer>? answers;

  Question({
    this.id,
    this.name,
    this.type,
    this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
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




