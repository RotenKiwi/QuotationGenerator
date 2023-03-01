import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  const backButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){
        return IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {Navigator.pop(context);},
          iconSize: constraint.maxWidth * 0.08,
        );
      },

    );
  }
}