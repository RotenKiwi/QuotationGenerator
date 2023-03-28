import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/registrationExpense.dart';
import 'package:sp_quotation/Screens/Urbania/registrationType.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';

class insuranceType extends StatefulWidget {
  const insuranceType({Key? key}) : super(key: key);

  @override
  State<insuranceType> createState() => _insuranceTypeState();
}

String? insurancetype;
String errorMessage = '';

class _insuranceTypeState extends State<insuranceType> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: constraints.maxHeight*0.07,),
            topBar(text: 'Insurance Type', maxWidth: constraints.maxWidth),
            Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                RadioListTile<String>(
                    title: Text('Dealer', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Dealer',
                    groupValue: insurancetype,
                    onChanged: (value) {
                      setState(() {
                        insurancetype = value.toString();
                        model.insuranceType = value;
                      });
                    }),
                SizedBox(height: 50,),
                RadioListTile<String>(
                    title: Text('Customer', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Self',
                    groupValue: insurancetype,
                    onChanged: (value) {
                      setState(() {
                        insurancetype = value.toString();
                        model.insuranceType = value;
                      });
                    }),

              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(errorMessage, style: TextStyle(color: Colors.red),),
            ),
            RoundedButton(
              text: 'Next',
              press: () {
                if(model.insuranceType == null){setState(() {
                  errorMessage = 'Select valid choice';
                });}
                else{Navigator.push(context,
                    MaterialPageRoute(builder: (context) => registrationType()));}
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
