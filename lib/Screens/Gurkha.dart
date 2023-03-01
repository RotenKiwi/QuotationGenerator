import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';

class Gurkha extends StatelessWidget {
  const Gurkha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              Container(
                //color: Colors.black,
                height: constraint.maxHeight * 0.07,
              ),
              topBar(text: 'Client Details', maxWidth: constraint.maxWidth,),
            ],
          );
        },
      ),
    );
  }
}
