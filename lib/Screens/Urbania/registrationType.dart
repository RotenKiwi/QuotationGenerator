import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceType.dart';
import 'package:sp_quotation/Screens/Urbania/otherCharges.dart';
import 'package:sp_quotation/Vehicles/Urbania/Urbania.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';
import 'commercialType.dart';

class registrationType extends StatefulWidget {
  const registrationType({Key? key}) : super(key: key);

  @override
  State<registrationType> createState() => _registrationTypeState();
}

String? registration;
String errorMessage = '';

class _registrationTypeState extends State<registrationType> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.07,
            ),
            topBar(text: 'Registration Type', maxWidth: constraints.maxWidth),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadioListTile<String>(
                        title: Text(
                          'Commercial Registration',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Commercial',
                        groupValue: registration,
                        onChanged: (value) {
                          setState(() {
                            registration = value.toString();
                            model.registrationType = value;
                          });
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    RadioListTile<String>(
                        title: Text(
                          'Private Registration',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Private',
                        groupValue: registration,
                        onChanged: (value) {
                          if(model.model == Urbania().model[0]){
                            setState(() {
                              registration = value.toString();
                              model.registrationType = value;
                              model.insurance = (model.price!*0.032).ceil();
                            });
                          }
                          else{
                            null;
                            setState(() {
                              errorMessage = 'Private passing only available for ${Urbania().model[0]}';
                            });
                          }
                        }),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
            RoundedButton(
              text: 'Next',
              press: () {
                if (model.registrationType == null) {
                  setState(() {
                    model.registrationType = 'Select valid option';
                  });
                } if(model.registrationType == 'Commercial') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => commercialRegistrationType()));
                }
               else{
                 model.rtoTax = (model.price!*0.146).ceil();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => otherCharge()));
                }
              },
              color: Colors.black,
              textColor: Colors.white,
              length: 0.85,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    });
  }
}
