import 'calculate_order_cost_body.dart';

class OrdersBody {
  String? price;
  String? name;
  String? phone;
  String? address;
  dynamic longitude;
  dynamic latitude;
  dynamic destinationLongitude;
  dynamic destinationLatitude;
  String? destinationAddress;
  String? serviceType;
  String? receivedDate;
  String? receivedTime;


  OrdersBody({
    this.price,
    this.name,
    this.phone,
    this.address,
    this.longitude,
    this.latitude,
    this.destinationLongitude,
    this.destinationLatitude,
    this.destinationAddress,
    this.serviceType,
    this.receivedDate,
    this.receivedTime,

  });

  factory OrdersBody.fromJson(Map<String, dynamic> json) => OrdersBody(
    price: json["price"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    destinationLongitude: json["destination_longitude"],
    destinationLatitude: json["destination_latitude"],
    destinationAddress: json["destination_address"],
    serviceType: json["service_type"],
    receivedDate: json["received_date"],
    receivedTime: json["received_time"],

  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "name": name,
    "phone": phone,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "destination_longitude": destinationLongitude,
    "destination_latitude": destinationLatitude,
    "destination_address": destinationAddress,
    "service_type": serviceType,
    "received_date": receivedDate,
    "received_time": receivedTime,

  };
}

