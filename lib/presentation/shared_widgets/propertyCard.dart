import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:task6/models/property.dart';
import 'package:task6/provider/propertyProvider.dart';
import 'package:provider/provider.dart';

class PropertyCard extends StatefulWidget {
  final AvailableSpace availableSpaces;
  const PropertyCard({super.key, required this.availableSpaces});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  @override
  Widget build(BuildContext context) {
    PropertyProvider provider = Provider.of<PropertyProvider>(context);
    return Card(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: provider.availableSpaces.length,
              itemBuilder: (context, index, realIndex) {
                return Image.network(
                  widget.availableSpaces.spaceImages[index],
                  fit: BoxFit.cover,
                  width: 350,
                  height: 100,
                );
              },
              options: CarouselOptions(
                //viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${widget.availableSpaces.propertyName}',
              style: TextStyle(
                color: Color(0xFF607385),
                fontFamily: 'MontserratRegular',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '${widget.availableSpaces.spaceTitle}',
                  style: TextStyle(
                    color: Color(0xFF3C4955),
                    fontFamily: 'MontserratMedium',
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                SvgIcon(
                  icon: SvgIconData('assets/icons/starIcon.svg'),
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 2,
                ),
                Text('${widget.availableSpaces.spaceRating}'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${widget.availableSpaces.spaceDescription}',
                    style: TextStyle(
                      color: Color(0xFF607385),
                      fontFamily: 'MontserratRegular',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
