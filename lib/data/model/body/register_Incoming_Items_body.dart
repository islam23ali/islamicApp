
class RegisterIncomingItemsBody {
  String? supplierId;
  String? billNumber;
  String? date;
  String? productId;
  String? amount;


  RegisterIncomingItemsBody({
    this.supplierId,
    this.billNumber,
    this.date,
    this.productId,
    this.amount,

  });

  factory RegisterIncomingItemsBody.fromJson(Map<String, dynamic> json) => RegisterIncomingItemsBody(
    supplierId: json["supplier_id"],
    billNumber: json["bill_number"],
    date: json["date"],
    productId: json["product_id"],
    amount: json["amount"],

  );

  Map<String, dynamic> toJson() => {
    "supplier_id": supplierId,
    "bill_number": billNumber,
    "date": date,
    "product_id": productId,
    "amount": amount,

  };
}
