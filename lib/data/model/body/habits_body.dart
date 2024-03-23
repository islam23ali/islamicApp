
class HabitsBody {
  String? goodDeedId;
  String? status;


  HabitsBody({
    this.goodDeedId,
    this.status,

  });

  factory HabitsBody.fromJson(Map<String, dynamic> json) => HabitsBody(
    goodDeedId: json["good_deed_id"],
    status: json["status"],

  );

  Map<String, dynamic> toJson() => {
    "good_deed_id": goodDeedId,
    "status": status,

  };
}
