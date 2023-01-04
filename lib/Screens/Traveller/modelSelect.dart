import 'package:flutter/material.dart';
import 'package:sp_quotation/Screens/Urbania/insuranceType.dart';
import 'package:sp_quotation/Vehicles/Urbania/Urbania.dart';
import '../../Vehicles/Traveller/Traveller-Passenger-NonAC.dart';
import '../../Vehicles/Urbania/pdf/model_info.dart' as model;
import '../../Components/RoundedButton.dart';
import '../../Components/TopBar.dart';

class TravellerModelSelect extends StatefulWidget {
  final String TravellerType;
  const TravellerModelSelect({Key? key, required this.TravellerType}) : super(key: key);

  @override
  State<TravellerModelSelect> createState() => _TravellerModelSelectState();
}

String selectedValue = TravellerPassengerNonAC().model[0];
int index = 0;
//String selectedColor = TravellerPassengerNonAC().colors[0];
//int colorIndex = 0;

class _TravellerModelSelectState extends State<TravellerModelSelect> {
  @override
  Widget build(BuildContext context) {

    (widget.TravellerType == 'Passenger (Non-AC)')? model.model = TravellerPassengerNonAC().model[index] :
    (widget.TravellerType == 'Passenger (AC)')? model.model = TravellerPassengerAC().model[index] :
    model.model = TravellerSchoolBusNonAC().model[index] ;

    model.model = Urbania().model[index];
    model.price = Urbania().price[index];
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
                                    //model.insurance = (model.price! * 0.0215).ceil();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: constraint.maxWidth * 0.075,
                    //       vertical: 15.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //       border: Border.all(
                    //         color: Colors.black,
                    //         width: 1,
                    //       ),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 10.0, vertical: 5),
                    //       child: DropdownButtonHideUnderline(
                    //         child: DropdownButton<String>(
                    //           menuMaxHeight: constraint.maxHeight * 0.3,
                    //           value: selectedColor,
                    //           items: Urbania().colors.map((String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value),
                    //             );
                    //           }).toList(),
                    //           onChanged: (value) {
                    //             setState(
                    //                   () {
                    //                 selectedColor = '${value}';
                    //                 colorIndex = Urbania()
                    //                     .colors
                    //                     .indexOf('${selectedColor}');
                    //                 model.color = Urbania().colors[colorIndex];
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

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
