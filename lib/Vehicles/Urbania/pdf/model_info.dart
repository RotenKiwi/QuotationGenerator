import 'package:sp_quotation/Vehicles/Urbania/Urbania.dart';

String? model;
int? price;
int? insurance;
int? rtoTax;
var totalCharges;
int? otherCharges;
var finalAmt;
String? color;
String? registrationType;
String? insuranceType;
String? registrationExpense;
String? commercialregistrationType;
String? other;

int crtemp = 3000;
int speedLock = 1500;
int rtoReceipts = 5100;
int radiumStrips = 4500;
int gprsActivation = 12500;
int fastTag = 700;
int facilitatingCharges = 19500;
int hsrp = 1500;

var calcTotalCharges = () {
  //Dealer Insurance
  if (insuranceType == 'Dealer') {
    //registration expense by Dealer
    if (registrationExpense == 'Dealer') {
      if (model == Urbania().model[0]) {
        return (insurance! + rtoTax! + crtemp);
      } else {
        return (insurance! +
            rtoTax! +
            rtoReceipts +
            crtemp +
            radiumStrips +
            gprsActivation +
            fastTag +
            facilitatingCharges);
      }
    }
    //registration expense not done by dealer
    else {
      return (insurance! + crtemp + hsrp);
    }
  }

  //Customer insurance
  else {
    //registration expense by Dealer
    if (registrationExpense == 'Dealer') {
      if (model == Urbania().model[0]) {
        return (rtoTax! + crtemp);
      } else {
        return (
            rtoTax! +
            rtoReceipts +
            crtemp +
            radiumStrips +
            gprsActivation +
            fastTag +
            facilitatingCharges);
      }
    }
    //registration expense not done by dealer
    else {
      return (crtemp + hsrp);
    }
  }
};

var finalCharge = () {
  return (totalCharges + price);
};
