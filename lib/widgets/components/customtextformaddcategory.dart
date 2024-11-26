import 'package:flutter/material.dart';
class CustomTextFormAddCategory extends StatelessWidget {
  final Color? color; // لون اختياري
  final String? hintText;
  final TextEditingController myController;
  final String? Function(String?)? validator;

  const CustomTextFormAddCategory({
    Key? key,
    this.color, // لون اختياري
    this.hintText,
    required this.myController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      decoration: InputDecoration(

        hintText: hintText ?? '', // استخدام النص التلميحي إذا كان معين، وإلا فارغ
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // تعديل الحواف الداخلية لتناسب الاحتياجات
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: color ?? Colors.grey, // استخدام اللون المخصص إذا كان معين، وإلا فالافتراضي Colors.grey
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color ?? Colors.grey), // استخدام اللون المخصص إذا كان معين، وإلا فالافتراضي Colors.grey
        ),
      ),
    );
  }
}
