import 'dart:convert';

Country CountryFromJson(String str) => Country.fromJson(json.decode(str));

String CountryToJson(Country data) => json.encode(data.toJson());

class Country {
  String idCountry;
  String countryName;
  String countryCode;
  String isoCode2;
  String isoCode3;

  Country({
    required this.idCountry,
    required this.countryName,
    required this.countryCode,
    required this.isoCode2,
    required this.isoCode3,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        idCountry: json["idCountry"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        isoCode2: json["isoCode2"],
        isoCode3: json["isoCode3"],
      );

  Map<String, dynamic> toJson() => {
        "idCountry": idCountry,
        "countryName": countryName,
        "countryCode": countryCode,
        "isoCode2": isoCode2,
        "isoCode3": isoCode3,
      };
}
