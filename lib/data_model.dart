import 'dart:convert';

List<Getdata> getdataFromJson(String str) =>
    List<Getdata>.from(json.decode(str).map((x) => Getdata.fromJson(x)));

String getdataToJson(List<Getdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getdata {
  Getdata({
    this.userId,
    this.id,
  required  this.title,
  required  this.body,
  });

  int? userId;
  int? id;
  String title;
  String body;

  factory Getdata.fromJson(Map<String, dynamic> json) => Getdata(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
