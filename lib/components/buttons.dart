import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyBotton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  const MyBotton(
      {super.key,
      required this.buttonText,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Center(
          child: Text(
        buttonText,
        style: TextStyle(color: textColor, fontSize: 20),
      )),
    );
  }
}
