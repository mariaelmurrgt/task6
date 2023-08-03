import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool isObsucred;

  CustomTextField({
    required this.title,
    required this.controller,
    required this.hintText,
    required this.isObsucred,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFB2BBCA),
            width: 0.2,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF323E48),
              fontFamily: 'MontserratRegular',
              fontSize: 10,
            ),
          ),
          TextField(
            controller: controller,
            obscureText: isObsucred,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Color(0xFFB2BBCA)),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
