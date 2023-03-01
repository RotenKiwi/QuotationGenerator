import 'package:flutter/material.dart';

import 'BackButton.dart';

class topBar extends StatelessWidget {
  const topBar({
    super.key,
    required this.text,
    required this.maxWidth,
  });

  final String text;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        backButton(
          maxWidth: maxWidth,
        ),
        SizedBox(
          width: maxWidth * 0.1,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: maxWidth * 0.07,
          ),
        ),
      ],
    );
  }
}
