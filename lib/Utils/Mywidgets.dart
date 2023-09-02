import 'package:flutter/material.dart';
import 'package:shopping_cart/Utils/colors.dart';

// Widget for buttons

class Mybutton extends StatelessWidget {
  String buttontext;
  VoidCallback onpress;
  Color buttonclr;
  Mybutton(
      {required this.buttontext,
      required this.onpress,
      required this.buttonclr});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: buttonclr, borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          buttontext,
          style: TextStyle(color: textcolor),
        )),
      ),
    );
  }
}
