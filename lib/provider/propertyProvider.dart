import 'package:task6/models/property.dart';
import 'package:task6/service/property_service.dart';
import 'package:flutter/material.dart';

class PropertyProvider with ChangeNotifier {
  PropertyService service = PropertyService();

  List<PropertyModel> _properties = [];
  List<AvailableSpace> _availableSpaces = [];
  PropertyModel? _selectedProperty;

  List<PropertyModel> get properties => _properties;
  List<AvailableSpace> get availableSpaces => _availableSpaces;
  PropertyModel? get selectedProperty => _selectedProperty;

  set properties(List<PropertyModel> newProperties) {
    _properties = newProperties;
    notifyListeners();
  }

  getAllProperties() async {
    _properties = await service.getAllProperties();
    print("Fetched countries: $_properties");
    notifyListeners();
  }

  updateSelectedProperty(PropertyModel newProperty) async {
    PropertyModel updatedProperty = newProperty;
    _selectedProperty = updatedProperty;
    updateAvailableSpaces();
    notifyListeners();
  }

  updateAvailableSpaces() {
    _availableSpaces = selectedProperty!.availableSpaces;
    print('${_availableSpaces}');
    notifyListeners();
  }
}
