
class PackageMealsBody {
  String? charityId;
  String? amount;
  String? date;


  PackageMealsBody({
    this.charityId,
    this.amount,
    this.date,

  });

  factory PackageMealsBody.fromJson(Map<String, dynamic> json) => PackageMealsBody(
    charityId: json["charity_id"],
    amount: json["amount"],
    date: json["date"],

  );

  Map<String, dynamic> toJson() => {
    "charity_id": charityId,
    "amount": amount,
    "date": date,

  };
}
