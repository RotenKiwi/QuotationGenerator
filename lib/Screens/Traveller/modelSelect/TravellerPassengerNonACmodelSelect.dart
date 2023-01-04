import 'package:flutter/material.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceType.dart';
import '../../../Vehicles/Traveller/Traveller-Passenger-NonAC.dart';
import '../../../Vehicles/Traveller/pdf/model_info.dart' as model;
import '../../../Components/RoundedButton.dart';
import '../../../Components/TopBar.dart';

class TravellerPassengerNonACModelSelect extends StatefulWidget {
  const TravellerPassengerNonACModelSelect({Key? key,}) : super(key: key);

  @override
  State<TravellerPassengerNonACModelSelect> createState() => _TravellerPassengerNonACModelSelectState();
}

String selectedValue = TravellerPassengerNonAC().model[0];
int index = 0;
//String selectedColor = TravellerPassengerNonAC().colors[0];
//int colorIndex = 0;

class _TravellerPassengerNonACModelSelectState extends State<TravellerPassengerNonACModelSelect> {
  @override
  Widget build(BuildContext context) {

    model.model = TravellerPassengerNonAC().model[index];
    model.price = TravellerPassengerNonAC().price[index];
    //model.color = Urbania().colors[colorIndex];
    //model.insurance = (model.price! * 0.0215).ceil();
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
                              items: TravellerPassengerNonAC().model.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(
                                      () {
                                    selectedValue = '${value}';
                                    index = TravellerPassengerNonAC()
                                        .model
                                        .indexOf('${selectedValue}');
                                    model.model = TravellerPassengerNonAC().model[index];
                                    model.price = TravellerPassengerNonAC().price[index];
                                    //model.insurance = (model.price! * 0.0215).ceil();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: constraint.maxHeight * 0.02,
                    ),
                  ],
                ),
              ),
              RoundedButton(
                text: 'Next',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => insuranceType()));
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
