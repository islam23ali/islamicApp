
class StockItemsModel {
  int? code;
  List<Datum>? data;
  String? message;

  StockItemsModel({
    this.code,
    this.data,
    this.message,
  });

  factory StockItemsModel.fromJson(Map<String, dynamic> json) => StockItemsModel(
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
  int? productId;
  int? storeId;
  Product? product;
  String? amount;

  Datum({
    this.id,
    this.productId,
    this.storeId,
    this.product,
    this.amount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productId: json["product_id"],
    storeId: json["store_id"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "store_id": storeId,
    "product": product?.toJson(),
    "amount": amount,
  };
}

class Product {
  int? id;
  String? name;
  String? type;

  Product({
    this.id,
    this.name,
    this.type,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
  };
}
