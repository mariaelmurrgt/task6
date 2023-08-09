import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/models/city.dart';
import 'package:task6/models/country.dart';
import 'package:task6/models/language.dart';
import 'package:task6/models/state.dart';
import 'package:task6/presentation/shared_widgets/global_button.dart';
import 'package:task6/provider/complete_profile_provider.dart';

class CompleteSignUp extends StatefulWidget {
  const CompleteSignUp({super.key});

  @override
  State<CompleteSignUp> createState() => _CompleteSignUpState();
}

class _CompleteSignUpState extends State<CompleteSignUp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState called");
    initiate();
  }

  void initiate() async {
    await Provider.of<CompleteProfileProvider>(context, listen: false)
        .getAllCountries();
    await Provider.of<CompleteProfileProvider>(context, listen: false)
        .getLanguages();
  }

  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<CompleteProfileProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Consumer<CompleteProfileProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Text(
                  'Complete Your Profile',
                  style: TextStyle(
                    fontFamily: 'MontserratMedium',
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 50.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFB2BBCA),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'MontserratMedium',
                            color: Color(0xFF323E48),
                          ),
                        ),
                        DropdownButton<Country>(
                          isExpanded: true,
                          value: provider.selectedCountry,
                          hint: Text(
                            'Select Country',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB2BBCA),
                            ),
                          ),
                          onChanged: (newValue) async {
                            await provider.updateSelectedCountry(newValue!);
                            //provider.resetState();
                            //provider.resetCity();
                            //await provider.getStatesByCountryId(newValue);
                          },
                          items: provider.countries.map((country) {
                            return DropdownMenuItem(
                              value: country,
                              child: Text(country.countryName),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFB2BBCA),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'MontserratMedium',
                            color: Color(0xFF323E48),
                          ),
                        ),
                        DropdownButton<StateModel>(
                          isExpanded: true,
                          value: provider.selectedSate,
                          hint: Text(
                            'Select State',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB2BBCA),
                            ),
                          ),
                          onChanged: (newValue) async {
                            await provider.updateSelectedState(newValue!);
                            //provider.resetCity();
                            //await provider.getCitiesByStateId(newValue);
                          },
                          items: provider.states.map((state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state.stateName),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFB2BBCA),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'MontserratMedium',
                            color: Color(0xFF323E48),
                          ),
                        ),
                        DropdownButton<City>(
                          isExpanded: true,
                          value: provider.selectedCity,
                          hint: Text(
                            'Select City',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB2BBCA),
                            ),
                          ),
                          onChanged: (newValue) async {
                            provider.updateSelectedCity(newValue!);
                          },
                          items: provider.cities.map((city) {
                            return DropdownMenuItem(
                              value: city,
                              child: Text(city.cityName),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFB2BBCA),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'MontserratMedium',
                            color: Color(0xFF323E48),
                          ),
                        ),
                        DropdownButton<Language>(
                          isExpanded: true,
                          value: provider.selectedLanguage,
                          hint: Text(
                            'Select Preferred Language',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFB2BBCA),
                            ),
                          ),
                          onChanged: (newValue) async {
                            provider.updateLanguage(newValue!);
                          },
                          items: provider.languages.map((language) {
                            return DropdownMenuItem(
                              value: language,
                              child: Text(language.languageDescription),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                GlobalButton(
                    title: 'Save',
                    color: Color(0xFF297BE6),
                    width: 350,
                    height: 50,
                    onPressed: () {
                      Navigator.pushNamed(context, '/display');
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
