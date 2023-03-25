import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/FormField.dart';
import 'package:sp_quotation/Components/RoundedButton.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Gurkha/ModelDetails.dart';
import 'package:sp_quotation/Screens/Urbania/modelSelect.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;

class Urbania_Client_Info extends StatelessWidget {
  const Urbania_Client_Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            children: [
              SizedBox(
                //color: Colors.black,
                height: constraint.maxHeight * 0.07,
              ),
              topBar(
                text: 'Client Details',
                maxWidth: constraint.maxWidth,
              ),
              SizedBox(
                height: constraint.maxHeight * 0.1,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    formField(
                      onChanged: (value){user.name = value;},
                        text: 'Name',
                        horizontalPadding: 10,
                        maxWidth: constraint.maxWidth),
                    formField(
                      onChanged: (value){user.location = value;},
                        text: 'Location',
                        horizontalPadding: 10,
                        maxWidth: constraint.maxWidth),
                    formField(
                      onChanged: (value){user.contactNo = value;},
                        text: 'Contact Number',
                        horizontalPadding: 10,
                        maxWidth: constraint.maxWidth),
                    formField(
                      onChanged: (value){user.bankHP = value;},
                        text: 'Bank HP',
                        horizontalPadding: 10,
                        maxWidth: constraint.maxWidth),
                    formField(
                      onChanged: (value){user.email = value;},
                        text: 'E-Mail',
                        horizontalPadding: 10,
                        maxWidth: constraint.maxWidth),
                  ],
                ),
              ),
              SizedBox(
                height: constraint.maxWidth * 0.05,
              ),
              RoundedButton(
                text: 'Next',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UrbaniaModelSelect()));
                },
                color: Colors.black,
                textColor: Colors.white,
                length: 0.85,
              ),
              SizedBox(
                height: constraint.maxWidth * 0.1,
              ),
            ],
          );
        },
      ),
    );
  }
}
