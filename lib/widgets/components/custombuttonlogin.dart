import 'package:flutter/material.dart';
import 'package:shopping/utils/constants.dart';

class CustomButtonLogin extends StatelessWidget {
  final void Function()? onPressed;
  final String title;

  const CustomButtonLogin({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 55,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      //color: Color.fromRGBO(143, 148, 251, 1), // Light blue
      color: kprimaryColor,
      textColor: Colors.white,
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Add an empty SizedBox to create space between text and icon
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
