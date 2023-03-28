import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceType.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
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
    return LayoutBuilder(builder: (context, constraints){
      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: constraints.maxHeight*0.07,),
            topBar(text: 'Registration Type', maxWidth: constraints.maxWidth),
            Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                RadioListTile<String>(
                    title: Text('Commercial Registration', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Commercial',
                    groupValue: registration,
                    onChanged: (value) {
                      setState(() {
                        registration = value.toString();
                        model.registrationType = value;
                      });
                    }),
                SizedBox(height: 50,),
                RadioListTile<String>(
                    title: Text('Private Registration', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Private',
                    groupValue: registration,
                    onChanged: (value) {
                      setState(() {
                        registration = value.toString();
                        model.registrationType = value;
                      });
                    }),

              ]),
            ),
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
            SizedBox(height: 50,),
          ],
        ),
      );
    });
  }
}
