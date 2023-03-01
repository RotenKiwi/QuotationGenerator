import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  const backButton({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_sharp),
      onPressed: () {
        Navigator.pop(context);
      },
      iconSize: maxWidth * 0.08,
    );
  }
}
