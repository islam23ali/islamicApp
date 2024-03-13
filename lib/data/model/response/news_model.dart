
class NewsModel {
  int? code;
  String? message;
  List<SingleNews>? data;
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  NewsModel({
    this.code,
    this.message,
    this.data,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SingleNews>.from(json["data"]!.map((x) => SingleNews.fromJson(x))),
    currentPage: json["current_page"],
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "current_page": currentPage,
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class SingleNews {
  int? id;
  String? image;
  String? title;
  String? description;
  String? date;

  SingleNews({
    this.id,
    this.image,
    this.title,
    this.description,
    this.date,
  });

  factory SingleNews.fromJson(Map<String, dynamic> json) => SingleNews(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "description": description,
    "date": date,
  };
}
