import 'package:flutter/material.dart';

import 'BackButton.dart';

class topBar extends StatelessWidget {
  const topBar({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){
        return Row(
          children: [
            backButton(),
            SizedBox(
              width: constraint.maxWidth * 0.1,
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: constraint.maxWidth * 0.07),
            ),
          ],
        );
      },
    );
  }
}
