import 'package:flutter/material.dart';
import 'package:task6/models/language.dart';
import 'package:task6/models/state.dart';
import 'package:task6/service/completeProfileService.dart';
import '../models/country.dart';
import '../models/city.dart';
import 'package:provider/provider.dart';

class CompleteProfileProvider with ChangeNotifier {
  CompleteProfileService service = CompleteProfileService();

  List<Country> _countries = [];
  List<StateModel> _states = [];
  List<City> _cities = [];
  List<Language> _languages = [];
  Country? _selectedCountry;
  StateModel? _selectedState;
  City? _selectedCity;
  Language? _selectedLanguage;

  List<Country> get countries => _countries;
  List<StateModel> get states => _states;
  List<City> get cities => _cities;
  List<Language> get languages => _languages;
  Country? get selectedCountry => _selectedCountry;
  StateModel? get selectedSate => _selectedState;
  City? get selectedCity => _selectedCity;
  Language? get selectedLanguage => _selectedLanguage;

  set countries(List<Country> newCountries) {
    _countries = newCountries;
    notifyListeners();
  }

  set states(List<StateModel> newStates) {
    _states = newStates;
    notifyListeners();
  }

  set cities(List<City> newcities) {
    _cities = newcities;
    notifyListeners();
  }

  getAllCountries() async {
    _countries = await service.getAllCountries();
    print("Fetched countries: $_countries");
    notifyListeners();
  }

  updateSelectedCountry(Country newCountry) {
    Country updatedCountry = newCountry;
    _selectedCountry = updatedCountry;
    notifyListeners();
  }

  getStatesByCountryId(Country country) async {
    _states = await service.getStatesByCountryId(country);
    notifyListeners();
  }

  updateSelectedState(StateModel newState) {
    StateModel updatedState = newState;
    _selectedState = updatedState;
    notifyListeners();
  }

  getCitiesByStateId(StateModel state) async {
    _cities = await service.getCityByStateId(state);
    print('$cities');
    notifyListeners();
  }

  getLanguages() async {
    _languages = await service.getLanguages();
    notifyListeners();
  }

  updateLanguage(Language newLanguage) {
    Language updatedLanguage = newLanguage;
    _selectedLanguage = updatedLanguage;
    notifyListeners();
  }

  updateSelectedCity(City newCity) {
    City updatedCity = newCity;
    _selectedCity = updatedCity;
    notifyListeners();
  }

  resetState() {
    _selectedState = null;
    _states.clear();
    notifyListeners();
  }

  resetCity() {
    _selectedCity = null;
    cities.clear();
    notifyListeners();
  }
}
