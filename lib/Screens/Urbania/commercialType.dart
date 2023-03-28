import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceType.dart';
import 'package:sp_quotation/Screens/Urbania/otherCharges.dart';
import '../../Vehicles/Urbania/Urbania.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';

class commercialRegistrationType extends StatefulWidget {
  const commercialRegistrationType({Key? key}) : super(key: key);

  @override
  State<commercialRegistrationType> createState() => _commercialRegistrationTypeState();
}

String? registration;
String errorMessage = '';

class _commercialRegistrationTypeState extends State<commercialRegistrationType> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.07,
            ),
            topBar(text: 'Commercial \nRegistration Type', maxWidth: constraints.maxWidth),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadioListTile<String>(
                        title: Text(
                          'Tours and Travels',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'T&T',
                        groupValue: registration,
                        onChanged: (value) {
                          setState(() {
                            registration = value.toString();
                            model.commercialregistrationType = value;
                          });
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    RadioListTile<String>(
                        title: Text(
                          'Staff Passing',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Staff',
                        groupValue: registration,
                        onChanged: (value) {
                          setState(() {
                            registration = value.toString();
                            model.commercialregistrationType = value;
                          });
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
                    errorMessage = 'Select valid option';
                  });
                }
                else{
                  int index = Urbania().model.indexOf(model.model!);
                  if(model.commercialregistrationType == 'T&T'){model.rtoTax = Urbania().rtoTaxTT[index] as int?;}
                  else{model.rtoTax = Urbania().rtoTaxStaff[index] as int?;}

                  print(model.model);
                  print(model.rtoTax);
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
