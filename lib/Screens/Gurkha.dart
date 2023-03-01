import 'package:flutter/material.dart';

class Gurkha extends StatelessWidget {
  const Gurkha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              SizedBox(
                height: constraint.maxHeight * 0.07,
              ),

            ],
          );
        },
      ),
    );
  }
}
