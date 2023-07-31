import 'dart:convert';

Language languageFromJson(String str) => Language.fromJson(json.decode(str));

String languageToJson(Language data) => json.encode(data.toJson());

class Language {
  String idLanguage;
  String languageCode;
  String languageDescription;

  Language({
    required this.idLanguage,
    required this.languageCode,
    required this.languageDescription,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        idLanguage: json["idLanguage"],
        languageCode: json["languageCode"],
        languageDescription: json["languageDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idLanguage": idLanguage,
        "languageCode": languageCode,
        "languageDescription": languageDescription,
      };
}
