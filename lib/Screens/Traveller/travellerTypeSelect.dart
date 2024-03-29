import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/RoundedButton.dart';
import 'modelSelect/TravellerPassengerACmodelSelect.dart';
import 'modelSelect/TravellerPassengerNonACmodelSelect.dart';
import 'modelSelect/TravellerSchoolBusNonAC.dart';

class TravellerTypeSelect extends StatefulWidget {
  const TravellerTypeSelect({Key? key}) : super(key: key);

  @override
  State<TravellerTypeSelect> createState() => _TravellerTypeSelectState();
}

class _TravellerTypeSelectState extends State<TravellerTypeSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RoundedButton(
              text: 'Passenger (Non-AC)',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TravellerPassengerNonACModelSelect()));
              },
              color: Colors.black,
              textColor: Colors.white,
              length: 0.85,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RoundedButton(
              text: 'Traveller (AC)',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TravellerPassengerACModelSelect()));
              },
              color: Colors.black,
              textColor: Colors.white,
              length: 0.85,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RoundedButton(
              text: 'SchoolBus (Non-AC)',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TravellerSchoolBusNonACSelect()));
              },
              color: Colors.black,
              textColor: Colors.white,
              length: 0.85,
            ),
          ),
        ],
      ),
    );
  }
}
