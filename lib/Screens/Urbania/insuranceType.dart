import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
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
                    title: Text('Self', style: TextStyle(fontSize: 25),),
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
