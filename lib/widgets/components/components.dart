import 'package:flutter/material.dart';
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.red,
  bool isUppercase = true,
   VoidCallback? function,
  required String text,
  double radius = 10.0,
}) =>
    Container(
      height: 50.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );