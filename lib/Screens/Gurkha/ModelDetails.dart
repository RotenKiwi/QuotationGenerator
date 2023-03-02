import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/FormField.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Models/Gurkha/Gurkha%204X4%20BSVI%20FM2.6CR2400WB(3+D).dart';
import 'package:sp_quotation/functions.dart';
import 'package:sp_quotation/variables.dart' as vari;

import '../../Components/CustomDropDown.dart';

class ModelDetails extends StatefulWidget {
  const ModelDetails({Key? key}) : super(key: key);

  @override
  State<ModelDetails> createState() => _ModelDetailsState();
}

String selectedValue = Gurkha().model[0];
int index = 0;

class _ModelDetailsState extends State<ModelDetails> {
  @override
  Widget build(BuildContext context) {

    int basicPrice = Gurkha().basicPrice[index];
    vari.gst = GST(basicPrice);
    vari.cess = Cess(basicPrice);
    vari.tcs = TCS(basicPrice, vari.gst, vari.cess);
    vari.exShowroomPrice = exShowroomPrice(basicPrice, vari.gst, vari.cess, vari.tcs);
    vari.insurance = insurance(vari.exShowroomPrice);
    vari.individualRegistrationExpense = individualRegistrationExpense(vari.exShowroomPrice);
    vari.corporateRegistrationExpense = corporateRegistrationExpense(vari.exShowroomPrice);
    vari.individualOnRoad = onRoadPriceIndividual(vari.exShowroomPrice, vari.insurance, vari.individualRegistrationExpense);
    vari.corporateOnRoad = onRoadPriceIndividual(vari.exShowroomPrice, vari.insurance, vari.corporateRegistrationExpense);

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
                              items: Gurkha().model.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    selectedValue = '${value}';
                                    index = Gurkha()
                                        .model
                                        .indexOf('${selectedValue}');
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'Basic Price : ',
                          value: basicPrice,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'GST : ',
                          value: vari.gst,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'Cess : ',
                          value: vari.cess,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'TCS : ',
                          value: vari.tcs,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'ex-Showroom Price : ',
                          value: vari.exShowroomPrice,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'Insurance : ',
                          value: vari.insurance,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'Individual Registration Expense : ',
                          value: vari.individualRegistrationExpense,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'Corporate Registration Expense : ',
                          value: vari.corporateRegistrationExpense,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'On Road Price (Individual) : ',
                          value: vari.individualOnRoad,
                        ),
                        calculatedValues(
                          fontSize: constraint.maxWidth * 0.04,
                          text: 'On Road Price (Corporate) : ',
                          value: vari.corporateOnRoad,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class calculatedValues extends StatelessWidget {
  const calculatedValues({
    super.key,
    required this.fontSize,
    required this.text,
    required this.value,
  });

  final double fontSize;
  final String text;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5.0),
          child: Text(
            '${value} ',
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
