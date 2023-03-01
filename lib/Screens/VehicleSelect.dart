import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/RoundedButton.dart';
import 'package:sp_quotation/Screens/Gurkha.dart';

class VehicleSelect extends StatefulWidget {
  const VehicleSelect({Key? key}) : super(key: key);

  @override
  State<VehicleSelect> createState() => _VehicleSelectState();
}

class _VehicleSelectState extends State<VehicleSelect> {
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
              text: 'Gurkha',
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Gurkha()));
              },
              color: Colors.black,
              textColor: Colors.white,
              length: 0.85,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RoundedButton(
              text: 'Traveller',
              press: () {},
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
