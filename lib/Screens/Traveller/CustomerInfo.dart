import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/FormField.dart';
import 'package:sp_quotation/Components/RoundedButton.dart';
import 'package:sp_quotation/Components/TopBar.dart';
import 'package:sp_quotation/Screens/Urbania/modelSelect.dart';
import '../../Vehicles/Urbania/pdf/userDetails.dart' as user;

class Traveller_Client_Info extends StatefulWidget {
  const Traveller_Client_Info({Key? key}) : super(key: key);

  @override
  State<Traveller_Client_Info> createState() => Traveller_Client_InfoState();
}

String errorMessage = '';

class Traveller_Client_InfoState extends State<Traveller_Client_Info> {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(errorMessage, style: TextStyle(color: Colors.red),),
              ),
              RoundedButton(
                text: 'Next',
                press: () {
                  if(user.name != null && user.location!=null && user.contactNo!=null && user.bankHP!=null ){
                    if(user.contactNo!.length == 10){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UrbaniaModelSelect()));
                    }
                    else{
                      setState(() {
                        errorMessage = "Enter valid Contact Number";
                      });
                    }
                  }
                  else{
                    setState(() {
                      errorMessage = "Enter valid Name, Location, Contact Number and Bank HP";
                    });
                  }
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
