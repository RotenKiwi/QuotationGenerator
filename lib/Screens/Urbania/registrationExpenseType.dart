import 'package:flutter/material.dart';
import 'package:sp_quotation/Screens/Urbania/otherCharges.dart';
import 'package:sp_quotation/Screens/Urbania/registrationExpense.dart';

import '../../Components/RoundedButton.dart';
import '../../Components/TopBar.dart';
import '../../Vehicles/Urbania/Urbania.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;

class registrationExpenseTypeDealer extends StatefulWidget {
  const registrationExpenseTypeDealer({Key? key}) : super(key: key);

  @override
  State<registrationExpenseTypeDealer> createState() => _registrationExpenseTypeDealerState();
}

String? registrationtypecheck;
String errorMessage = '';
int index = Urbania().model.indexOf(model.model!);

class _registrationExpenseTypeDealerState extends State<registrationExpenseTypeDealer> {
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
                          'Private Registration',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Priv',
                        groupValue: registrationtypecheck,
                        onChanged: (value) {
                          if(model.model == Urbania().model[0]){
                            setState(() {
                              registrationtypecheck = value.toString();
                              //model.insurancetype = insurancetype;
                              //model.insurance = (model.price! * 0.032).ceil();
                              //print(model.insurance);
                            });
                            print(model.insuranceType);
                          }
                          else{
                            null;
                            setState(() {
                              errorMessage = 'Private Insurance is available only for ${Urbania().model[0]}';
                            });
                          }

                        }),
                    SizedBox(
                      height: 50,
                    ),
                    RadioListTile<String>(
                        title: Text(
                          'Tours and Travels',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'T&T',
                        groupValue: registrationtypecheck,
                        onChanged: (value) {
                          if(model.model == Urbania().model[3] || model.model==Urbania().model[4]){
                            setState(() {
                              registrationtypecheck = value.toString();
                              model.commercialregistrationType = value;
                              //model.insurance = (model.price! * 0.026).ceil();
                              //print(model.price);
                              //print(model.insurance);
                            });
                            print(model.insuranceType);
                          }
                          else{
                            null;
                            setState(() {
                              errorMessage = 'T&T Insurance not available for ${model.model}';
                            });
                          }
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    RadioListTile<String>(
                        title: Text(
                          'PPRS',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'PPRS',
                        groupValue: registrationtypecheck,
                        onChanged: (value) {
                          if(model.model != Urbania().model[0]){
                            setState(() {
                              registrationtypecheck = value.toString();
                              model.commercialregistrationType = value;
                              //model.insurancetype = insurancetype;
                              //model.insurance = (model.price! * 0.022).ceil();
                              //print(model.insurance);
                            });
                            print(model.insuranceType);
                          }
                          else{
                            null;
                            setState(() {
                              errorMessage = 'PPRS Insurance not available for ${Urbania().model[0]}';
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
                if (registrationtypecheck == null) {
                  setState(() {
                    errorMessage = 'Select valid choice';
                  });
                }
                else if (model.model != Urbania().model[0] && registrationtypecheck == 'Priv'){
                  setState(() {
                    errorMessage = 'Private Insurance is available only for ${Urbania().model[0]}';
                  });
                }
                else if ((model.model == Urbania().model[1] || model.model == Urbania().model[2]) && registrationtypecheck == 'T&T'){
                  setState(() {
                    errorMessage = 'T&T Insurance is not available for ${model.model}';
                  });
                }
                else {
                  if(registrationtypecheck == "Priv"){model.rtoTax = (model.price!*0.1475).ceil();}
                  else if (registrationtypecheck == "T&T"){model.rtoTax = Urbania().rtoTaxTT[index];}
                  else if (registrationtypecheck == "PPRS"){model.rtoTax = Urbania().rtoTaxStaff[index];}
                  else{model.rtoTax = 0;}
                  print(model.rtoTax);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> otherCharge()));
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
