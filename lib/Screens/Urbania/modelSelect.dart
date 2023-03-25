import 'package:flutter/material.dart';
import 'package:sp_quotation/Screens/Urbania/registrationType.dart';
import 'package:sp_quotation/Vehicles/Urbania/Urbania.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/FormField.dart';
import '../../Components/RoundedButton.dart';
import '../../Components/TopBar.dart';

class UrbaniaModelSelect extends StatefulWidget {
  const UrbaniaModelSelect({Key? key}) : super(key: key);

  @override
  State<UrbaniaModelSelect> createState() => _UrbaniaModelSelectState();
}

String selectedValue = Urbania().model[0];
int index = 0;

class _UrbaniaModelSelectState extends State<UrbaniaModelSelect> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: constraint.maxHeight * 0.07,
              ),
              topBar(
                text: 'Model Details',
                maxWidth: constraint.maxWidth,
              ),
              SizedBox(
                height: constraint.maxHeight * 0.1,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraint.maxWidth * 0.075,
                          vertical: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              menuMaxHeight: constraint.maxHeight * 0.3,
                              value: selectedValue,
                              items: Urbania().model.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedValue = '${value}';
                                    index = Urbania()
                                        .model
                                        .indexOf('${selectedValue}');
                                    model.model = Urbania().model[index];
                                    model.price = Urbania().price[index];
                                    model.insurance =
                                        (model.price! * 0.0215).ceil();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    formField(
                        text: 'Colour',
                        horizontalPadding: constraint.maxWidth * 0.075,
                        maxWidth: constraint.maxWidth),
                    SizedBox(
                      height: constraint.maxHeight * 0.02,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'Basic Price : ',
                    //       value: basicPrice,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'GST : ',
                    //       value: vari.gst,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'Cess : ',
                    //       value: vari.cess,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'TCS : ',
                    //       value: vari.tcs,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'ex-Showroom Price : ',
                    //       value: vari.exShowroomPrice,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'Insurance : ',
                    //       value: vari.insurance,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'Individual Registration Expense : ',
                    //       value: vari.individualRegistrationExpense,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'Corporate Registration Expense : ',
                    //       value: vari.corporateRegistrationExpense,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'On Road Price (Individual) : ',
                    //       value: vari.individualOnRoad,
                    //     ),
                    //     calculatedValues(
                    //       fontSize: constraint.maxWidth * 0.04,
                    //       text: 'On Road Price (Corporate) : ',
                    //       value: vari.corporateOnRoad,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              RoundedButton(
                text: 'Next',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registrationType()));
                },
                color: Colors.black,
                textColor: Colors.white,
                length: 0.85,
              ),
              SizedBox(
                height: constraint.maxHeight * 0.1,
              ),
            ],
          ),
        );
      },
    );
  }
}
