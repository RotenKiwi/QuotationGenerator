import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceTypeDealer.dart';
import 'package:sp_quotation/Screens/Urbania/registrationExpense.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';

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
                        title: const Text(
                          'Dealer',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Dealer',
                        groupValue: insurancetype,
                        onChanged: (value) {
                          setState(() {
                            insurancetype = value.toString();
                            model.insuranceType = value;
                          });
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    RadioListTile<String>(
                        title: const Text(
                          'Customer',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Colors.black,
                        value: 'Customer',
                        groupValue: insurancetype,
                        onChanged: (value) {
                          setState(() {
                            insurancetype = value.toString();
                            model.insuranceType = value;
                            print(model.insuranceType);
                          });
                        }),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            RoundedButton(
              text: 'Next',
              press: () {
                if (model.insuranceType == null) {
                  setState(() {
                    errorMessage = 'Select valid choice';
                  });
                } else if (model.insuranceType == 'Dealer') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const insuranceTypeDealer()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const registrationExpense(
                                insurancetype: 'Customer',
                              )));
                }
              },
              color: Colors.black,
              textColor: Colors.white,
              length: 0.85,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    });
  }
}
