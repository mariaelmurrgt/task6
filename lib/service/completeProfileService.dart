import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task6/models/language.dart';
import '../models/country.dart';
import 'package:task6/models/state.dart';
import '../models/city.dart';

class CompleteProfileService {
  Future<List<Country>> getAllCountries() async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/countries?page=0&size=300"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'];

      if (result != null && result is List) {
        final finalResponse =
            result.map((map) => Country.fromJson(map)).toList();
        return finalResponse;
      }
      return [];
    } catch (e) {
      print("Error fetching countries: $e");
      return [];
    }
  }

  Future<List<StateModel>> getStatesByCountryId(Country country) async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/country/${country.idCountry}/states"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'];

      if (result != null && result is List) {
        final finalResponse =
            result.map((map) => StateModel.fromJson(map)).toList();
        return finalResponse;
      }
      return [];
    } catch (e) {
      print("Error fetching states: $e");
      return [];
    }
  }

  Future<List<City>> getCityByStateId(StateModel state) async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/state/%${state.idState}/cities"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'];

      if (result != null && result is List) {
        final finalResponse = result.map((map) => City.fromJson(map)).toList();
        return finalResponse;
      }
      return [];
    } catch (e) {
      print("Error fetching states: $e");
      return [];
    }
  }

  Future<List<Language>> getLanguages() async {
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/languages?page=0&size=170"));
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'];

      if (result != null && result is List) {
        final finalResponse =
            result.map((map) => Language.fromJson(map)).toList();
        return finalResponse;
      }
      return [];
    } catch (e) {
      print("Error fetching states: $e");
      return [];
    }
  }
}
