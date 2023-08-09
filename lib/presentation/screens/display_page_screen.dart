import 'package:flutter/material.dart';
import 'package:task6/provider/complete_profile_provider.dart';
import 'package:provider/provider.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Selected'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Consumer<CompleteProfileProvider>(
          builder: (context, provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (provider.selectedCountry != null)
                  Column(
                    children: [
                      Text(
                          'Country Name: ${provider.selectedCountry!.countryName}'),
                      SizedBox(height: 5),
                      Text(
                          'Country ID: ${provider.selectedCountry!.idCountry}'),
                    ],
                  ),
                SizedBox(height: 10),
                if (provider.selectedSate != null)
                  Column(
                    children: [
                      Text('State Name: ${provider.selectedSate!.stateName}'),
                      SizedBox(height: 5),
                      Text('State ID: ${provider.selectedSate!.idState}'),
                    ],
                  ),
                SizedBox(height: 10),
                if (provider.selectedCity != null)
                  Column(
                    children: [
                      Text('City Name: ${provider.selectedCity!.cityName}'),
                      SizedBox(height: 5),
                      Text('City ID: ${provider.selectedCity!.idCity}'),
                    ],
                  ),
                SizedBox(height: 10),
                if (provider.selectedLanguage != null)
                  Text(
                      'Preferred Language: ${provider.selectedLanguage!.languageDescription}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
