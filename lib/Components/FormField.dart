import 'package:flutter/material.dart';

class formField extends StatelessWidget {
  final String text;
  //final Color textColor;
  final double horizontalPadding;
  final double maxWidth;
  final Function(String)? onChanged;

  const formField({
    super.key,
    required this.text,
    //required this.textColor,
    required this.horizontalPadding,
    required this.maxWidth, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 15),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            //color: textColor,
            color: Colors.black,
            fontSize: maxWidth * 0.04,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
