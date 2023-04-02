import 'package:flutter/material.dart';
import 'package:sp_quotation/Screens/Urbania/registrationExpense.dart';

import '../../Components/RoundedButton.dart';
import '../../Components/TopBar.dart';
import '../../Vehicles/Urbania/Urbania.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;

class insuranceTypeDealer extends StatefulWidget {
  const insuranceTypeDealer({Key? key}) : super(key: key);

  @override
  State<insuranceTypeDealer> createState() => _insuranceTypeDealerState();
}

String? insurancetype;
String errorMessage = '';

class _insuranceTypeDealerState extends State<insuranceTypeDealer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.07,
            ),
            topBar(text: 'Insurance Type', maxWidth: constraints.maxWidth),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadioListTile<String>(
                        title: Text(
                          'Private Insurance',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Priv',
                        groupValue: insurancetype,
                        onChanged: (value) {
                          if(model.model == Urbania().model[0]){
                            setState(() {
                              insurancetype = value.toString();
                              //model.insurancetype = insurancetype;
                              model.insurance = (model.price! * 0.032).ceil();
                              print(model.insurance);
                            });
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
                        groupValue: insurancetype,
                        onChanged: (value) {
                          if(model.model == Urbania().model[3] || model.model==Urbania().model[4]){
                            setState(() {
                              insurancetype = value.toString();
                              //model.insurancetype = insurancetype;
                              model.insurance = (model.price! * 0.024).ceil();
                              print(model.insurance);
                            });
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
                        groupValue: insurancetype,
                        onChanged: (value) {
                          if(model.model != Urbania().model[0]){
                            setState(() {
                              insurancetype = value.toString();
                              //model.insurancetype = insurancetype;
                              model.insurance = (model.price! * 0.02).ceil();
                              print(model.insurance);
                            });
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
                if (model.insuranceType == null) {
                  setState(() {
                    errorMessage = 'Select valid choice';
                  });
                }
                else if (model.model != Urbania().model[0] && insurancetype == 'Priv'){
                  setState(() {
                    errorMessage = 'Private Insurance is available only for ${Urbania().model[0]}';
                  });
                }
                else if ((model.model == Urbania().model[1] || model.model == Urbania().model[2]) && insurancetype == 'T&T'){
                  setState(() {
                    errorMessage = 'T&T Insurance is not available for ${model.model}';
                  });
                }
                else {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> registrationExpense(insurancetype: insurancetype!,)));
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
