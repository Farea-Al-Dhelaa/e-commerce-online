import 'package:flutter/material.dart';

class CustomButtonUpload extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool isSelected;

  const CustomButtonUpload({super.key, this.onPressed, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      minWidth: 200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color:isSelected? Colors.green : Colors.blue,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}