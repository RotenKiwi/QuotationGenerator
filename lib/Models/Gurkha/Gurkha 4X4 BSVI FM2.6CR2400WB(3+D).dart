import 'package:flutter/material.dart';

class Gurkha_4X4_BSVI_FM2_6CR2400WB {
  String model = 'Gurkha 4X4 BSVI FM2.6CR2400WB(3+D)';
  Color? colour;

  int basicPrice = 1002361;

  var Accessories = [
    'Alloy Wheels',
    'Half Ladder',
    'Wind Screen Bar',
    'Roof Rail',
    'Roof Carrier',
    'Child Seats (2 No)',
    'Rier View Camera',
    'Bottom Side Anti Rusting Coating',
    'Rogerab Suspension Modulator (Front & Rear)',
    'Jackon Kit (Eletric Jack with Gun & Compressor)',
    'Roger Tyremates STU99 (Tyre Press Monitor)',
    'Rogerot N (Battery Voltage Stabilizer)',
    'Kulon (G) (Ventilated Seat)',
    'Toway 3 Ton',
  ];

  var AccessoriesPrice = [
    52500,
    1950,
    5900,
    5575,
    20500,
    9600,
    3950,
    4100,
    8200,
    10500,
    5340,
    2800,
    6250,
    1650,
  ];

}

int GST(int price) {
  return price * 0.28.toInt().ceil();
}

int Cess(int price) {
  return price * 0.2.toInt().ceil();
}

int TCS(int price) {
  return price * 0.01.toInt().ceil();
}

int exShowroomPrice(int price, int gst, int cess, int tcs) {
  return price + gst + cess + tcs;
}

int insurance(int exShowroomPrice) {
  return exShowroomPrice * 0.45.toInt().ceil();
}

int individualRegistrationExpense(int exShowroomPrice) {
  return exShowroomPrice * 0.1475.toInt().ceil();
}

int corporateRegistrationExpense(int exShowroomPrice) {
  return exShowroomPrice * 0.215.toInt().ceil();
}

int onRoadPriceIndividual(
    int exShowroomPrice, int insurance, int individualRegistrationExpense) {
  return exShowroomPrice + insurance + individualRegistrationExpense;
}

int onRoadPriceCorporate(
    int exShowroomPrice, int insurance, int corporateRegistrationExpense) {
  return exShowroomPrice + insurance + corporateRegistrationExpense;
}

int onRoadPrice(int exShowroomPrice, int insurance, int registrationExpense, int accessoryTotal, int discount){
  return exShowroomPrice+insurance+registrationExpense+accessoryTotal-discount;
}