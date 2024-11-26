import 'package:flutter/material.dart';
class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double containerSize = constraints.maxWidth * 0.3; // Adjust size as needed
          return Container(
            width: containerSize,
            height: containerSize,
            padding: EdgeInsets.all(containerSize * 0.1), // Adjust padding proportionally
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF9FC5E8),
                  Color(0xFFFFFFFF),
                  // Color(0xFF7EB9EC),
                  // Color(0xFF7EB9EC),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 1), // Changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(containerSize * 3), // Adjust radius proportionally
            ),
            child: Image.asset(
              'assets/images/slider3.png',
              height: containerSize *0.2, 
              width: containerSize * 12,
             fit: BoxFit.fitWidth,
            ),
          );
        },
      ),
    );
  }
}
