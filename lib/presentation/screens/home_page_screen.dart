import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:task6/models/property.dart';
import 'package:task6/presentation/shared_widgets/propertyCard.dart';
import 'package:task6/provider/propertyProvider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState called");
    initiate();
  }

  void initiate() async {
    await Provider.of<PropertyProvider>(context, listen: false)
        .getAllProperties();
  }

  @override
  Widget build(BuildContext context) {
    PropertyProvider provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: Consumer<PropertyProvider>(
          builder: (context, provider, _) {
            return AppBar(
              toolbarHeight: 140,
              backgroundColor: Color(0xFF607385),
              title: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SvgIcon(icon: SvgIconData('assets/icons/burgerIcon.svg')),
                      SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 40,
                          width: 310,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: DropdownButton2<PropertyModel>(
                            value: provider.selectedProperty,
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                SvgIcon(
                                  icon: SvgIconData(
                                      'assets/icons/propertyIcon.svg'),
                                  color: Color(0xFF323E48),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Select Property',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'MontserratRegular',
                                      color: Color(0xFF323E48),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            items: provider.properties.map((property) {
                              return DropdownMenuItem(
                                value: property,
                                child: Text(property.propertyName),
                              );
                            }).toList(),
                            onChanged: (value) {
                              provider.updateSelectedProperty(value!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: DropdownButton2<PropertyModel>(
                          isExpanded: true,
                          hint: const Row(
                            children: [
                              SvgIcon(
                                icon: SvgIconData('assets/icons/dateIcon.svg'),
                                color: Color(0xFF323E48),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Select Dates',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'MontserratRegular',
                                    color: Color(0xFF323E48),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          items: [],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 40,
                        width: 163,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: DropdownButton2<PropertyModel>(
                          isExpanded: true,
                          hint: const Row(
                            children: [
                              Icon(
                                Icons.person_add,
                                color: Color(0xFF323E48),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Guests & Rooms',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'MontserratRegular',
                                    color: Color(0xFF323E48),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          items: [],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: Container(
        color: Color(0xFFF9F9F9),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Available Properties',
                style: TextStyle(
                  fontFamily: 'MontserratMedium',
                  fontSize: 16,
                  color: Color(0xFF323E48),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.availableSpaces.length,
              itemBuilder: (context, index) {
                final availableSpaces = provider.availableSpaces[index];
                return PropertyCard(availableSpaces: availableSpaces);
              },
            ),
          ],
        ),
      ),
    );
  }
}
