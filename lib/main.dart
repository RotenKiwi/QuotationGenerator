import 'package:flutter/material.dart';
import 'package:sp_quotation/Screens/LoginScreen.dart';
import 'Screens/Traveller/travellerTypeSelect.dart';
import 'Screens/VehicleSelect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      //home: VehicleSelect(),
    );
  }
}

