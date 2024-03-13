
class QualityReportBody {
  String? charityId;
  String? note;
  List<List<int>>? detailsList;


  QualityReportBody({
    this.charityId,
    this.note,
    this.detailsList,

  });

  factory QualityReportBody.fromJson(Map<String, dynamic> json) => QualityReportBody(
    charityId: json["charity_id"],
    note: json["note"],
    detailsList: json["details_list"],

  );

  Map<String, dynamic> toJson() => {
    "charity_id": charityId,
    "note": note,
    "details_list": detailsList,

  };
}
