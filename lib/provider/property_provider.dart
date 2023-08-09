import 'package:task6/models/property.dart';
import 'package:task6/service/property_service.dart';
import 'package:flutter/material.dart';

class PropertyProvider with ChangeNotifier {
  PropertyService service = PropertyService();
  List<PropertyModel> _properties = [];

  PropertyModel? _selectedProperty;

  List<PropertyModel> get properties => _properties;
  PropertyModel? get selectedProperty => _selectedProperty;

  set properties(List<PropertyModel> newProperties) {
    _properties = newProperties;
    notifyListeners();
  }

  getAllProperties() async {
    _properties = await service.getAllProperties();
    _selectedProperty = _properties.first;
    print("Fetched properties: $_properties");
    notifyListeners();
  }

  updateSelectedProperty(PropertyModel newProperty) async {
    PropertyModel updatedProperty = newProperty;
    _selectedProperty = updatedProperty;
    notifyListeners();
  }

  void setCurrentIndex(AvailableSpace availableSpace, int newIndex) {
    availableSpace.currentIndex = newIndex;
    notifyListeners();
  }
}
