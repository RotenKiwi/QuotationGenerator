import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  final double length;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FractionallySizedBox(
          widthFactor: length,
          child: Container(
            //width: length.width,
            color: color,
            child: TextButton(
                onPressed: press,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                  ),
                )),
          ),
        ));
  }
}