import 'dart:ffi';

import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final double width;
  final double height;

  GlobalButton({
    required this.title,
    required this.color,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'MontserratMedium',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
