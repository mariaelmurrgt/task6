import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  String idCity;
  String cityName;

  City({
    required this.idCity,
    required this.cityName,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        idCity: json["idCity"],
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "idCity": idCity,
        "cityName": cityName,
      };
}
