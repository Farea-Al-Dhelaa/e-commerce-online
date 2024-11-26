import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  // Widget parameters
  final String hinttext; // Placeholder text displayed inside the input field.
  final String? Function(String?)? validator; // Validation function for checking input values.
  final TextEditingController mycontroller; // Controller to manage the text input.

  // Constructor to initialize the widget parameters
   CustomTextForm({
    Key? key,
    required this.hinttext,
    required this.mycontroller,
    required this.validator, // Pass the validation function to the widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr, // Right-to-left text direction for Arabic input.
      textAlign: TextAlign.left, // Align the input text to the right.
      controller: mycontroller, // Attach the text controller.
      validator: validator, // Attach the validation function.
      decoration: InputDecoration(
        hintText: hinttext, // Set placeholder text.
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey, // Styling for placeholder text.
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20, // Inner padding for the text field.
        ),
        filled: true, // Enable background color.
        fillColor: Colors.white, // Set the background color to white.
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 184, 184, 184), // Default border color.
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Rounded border corners.
          borderSide: const BorderSide(color: Colors.grey), // Border styling when enabled.
        ),
      ),
    );
  }
}
