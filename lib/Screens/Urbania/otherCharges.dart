import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Vehicles/Urbania/pdf/pdfpage.dart';
import '../../Components/FormField.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Vehicles/Urbania/pdf/pdf_page.dart';

class otherCharge extends StatefulWidget {
  const otherCharge({Key? key}) : super(key: key);

  @override
  State<otherCharge> createState() => _otherChargeState();
}

String? registrationexpense;

class _otherChargeState extends State<otherCharge> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.07,
            ),
            topBar(text: 'Other charges', maxWidth: constraints.maxWidth),
            formField(
              text: 'Other Charges?',
              horizontalPadding: 10.0,
              maxWidth: constraints.maxWidth,
              onChanged: (value) {
                model.other = value;
              },
            ),
            formField(
              text: 'Amount (no commas)',
              horizontalPadding: 10.0,
              maxWidth: constraints.maxWidth,
              onChanged: (value) {
                setState(() {
                  model.otherCharges = int.parse(value);
                });
              },
            ),
            RoundedButton(
              text: 'Next',
              press: () {
                if(model.otherCharges == null){model.otherCharges=0;}
                model.totalCharges = calcTotalCharges();
                model.finalAmt = finalCharge();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pdfPage()));
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
