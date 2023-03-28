import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';
import 'otherCharges.dart';

class registrationExpense extends StatefulWidget {
  const registrationExpense({Key? key}) : super(key: key);

  @override
  State<registrationExpense> createState() => _registrationExpenseState();
}

String? registrationexpense;

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
                      });
                    }),
                SizedBox(height: 50,),
                RadioListTile<String>(
                    title: Text('Self', style: TextStyle(fontSize: 25),),
                    activeColor: Colors.black,
                    value: 'Self',
                    groupValue: registrationexpense,
                    onChanged: (value) {
                      setState(() {
                        registrationexpense = value.toString();
                        model.registrationExpense = value;
                      });
                    }),

              ]),
            ),
            RoundedButton(
              text: 'Next',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => otherCharges()));
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
