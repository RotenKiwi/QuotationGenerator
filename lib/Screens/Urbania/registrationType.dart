import 'package:flutter/material.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;

import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';

class registrationType extends StatefulWidget {
  const registrationType({Key? key}) : super(key: key);

  @override
  State<registrationType> createState() => _registrationTypeState();
}

String? registration;

class _registrationTypeState extends State<registrationType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RadioListTile<String>(
            title: Text('Commercial'),
            activeColor: Colors.black,
            value: 'Commercial',
            groupValue: registration,
            onChanged: (value) {
              setState(() {
                registration = value.toString();
              });
            }),
        RadioListTile<String>(
            title: Text('Private'),
            activeColor: Colors.black,
            value: 'Private',
            groupValue: registration,
            onChanged: (value) {
              setState(() {
                registration = value.toString();
              });
            }),
        RoundedButton(
          text: 'Next',
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => pdfPage()));
          },
          color: Colors.black,
          textColor: Colors.white,
          length: 0.85,
        ),
      ]),
    ));
  }
}
