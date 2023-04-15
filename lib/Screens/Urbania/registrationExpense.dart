import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceType.dart';
import 'package:sp_quotation/Screens/Urbania/registrationExpenseType.dart';
import 'package:sp_quotation/Vehicles/Urbania/Urbania.dart';
import 'package:sp_quotation/Vehicles/Urbania/pdf/pdfpage.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';
import 'otherCharges.dart';

class registrationExpense extends StatefulWidget {
  final String insurancetype; //possible value => Priv, T&T, PPRS, Customer
  const registrationExpense({Key? key, required this.insurancetype}) : super(key: key);

  @override
  State<registrationExpense> createState() => _registrationExpenseState();
}

String? registrationexpense;
String errorMessage = '';
int index = Urbania().model.indexOf(model.model!);

class _registrationExpenseState extends State<registrationExpense> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints){
      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: constraints.maxHeight*0.07,),
            topBar(text: 'Registration Expense', maxWidth: constraints.maxWidth),
            Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                RadioListTile<String>(
                    title: Text('Dealer', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Dealer',
                    groupValue: registrationexpense,
                    onChanged: (value) {
                      setState(() {
                        registrationexpense = value.toString();
                        model.registrationExpense = value;
                        model.registrationType = 'Commercial';
                        if(model.insuranceType != 'Customer'){
                          if(widget.insurancetype == "Priv"){model.rtoTax = (model.price!*0.1475).ceil();}
                          else if (widget.insurancetype == "T&T"){model.rtoTax = Urbania().rtoTaxTT[index];}
                          else if (widget.insurancetype == "PPRS"){model.rtoTax = Urbania().rtoTaxStaff[index];}
                          else{model.rtoTax = 0;}
                        }
                      });
                      print(model.insuranceType);
                    }),
                SizedBox(height: 50,),
                RadioListTile<String>(
                    title: Text('Customer', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Self',
                    groupValue: registrationexpense,
                    onChanged: (value) {
                      setState(() {
                        registrationexpense = value.toString();
                        model.registrationExpense = value;
                        model.registrationType = 'Private';
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
                if(model.insuranceType == 'Customer' && model.registrationExpense == 'Dealer'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>registrationExpenseTypeDealer()));
                }
                else if(model.registrationExpense==null){
                  setState(() {
                    errorMessage = 'Select valid option';
                  });
                }else{Navigator.push(context,
                    MaterialPageRoute(builder: (context) => otherCharge()));}

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
