import 'package:flutter/material.dart';
import 'package:sp_quotation/Components/RoundedButton.dart';
import 'package:sp_quotation/Screens/VehicleSelect.dart';
import '../Users.dart';
import '../Components/FormField.dart';
import '../Vehicles/Urbania/pdf/employee.dart' as emp;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String passwrd = '';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              formField(
                text: 'Username',
                horizontalPadding: 15.0,
                maxWidth: constraints.maxWidth,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              formField(
                text: 'Password',
                horizontalPadding: 15.0,
                maxWidth: constraints.maxWidth,
                onChanged: (value) {
                  setState(() {
                    passwrd = value;
                  });
                },
              ),
              Text(errorMessage, style: TextStyle(color: Colors.red),),
              SizedBox(height: 10,),
              RoundedButton(
                text: 'Login',
                press: () {
                  users.contains(username)
                      ? ((passwrd == password[users.indexOf(username)])
                          ? (
                      Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VehicleSelect())))
                          : errorMessage = 'Incorrect Password')
                      : errorMessage = 'User does not exist';
                  setState(() {
                    emp.name = username;
                  });
                },
                color: Colors.blue,
                textColor: Colors.white,
                length: 0.85,
              ),
            ],
          );
        },
      ),
    );
  }
}
