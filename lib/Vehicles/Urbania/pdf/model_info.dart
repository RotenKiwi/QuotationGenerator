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
String? other;

int crtemp = 3000;
int speedLock = 1500;
int rtoReceipts = 5100;
int radiumStrips = 4500;
int gprsActivation = 12500;
int fastTag = 850;
int facilitatingCharges = 19500;
int hsrp = 65500;

var calcTotalCharges = () {
  if (registrationType == 'Commercial') {
    if (insuranceType == 'Dealer') {
      if (registrationExpense == 'Dealer') {
        return (facilitatingCharges +
            fastTag +
            gprsActivation +
            radiumStrips +
            rtoReceipts +
            rtoTax! +
            insurance! +
            speedLock +
            crtemp + otherCharges!);
      } else {
        return (insurance! + speedLock + crtemp+ otherCharges!);
      }
    } else {
      if (registrationExpense == 'Dealer') {
        return (facilitatingCharges +
            fastTag +
            gprsActivation +
            radiumStrips +
            rtoReceipts +
            rtoTax! +
            speedLock +
            crtemp+ otherCharges!);
      } else {
        return (speedLock + crtemp+ otherCharges!);
      }
    }
  } else {
    if (insuranceType == 'Dealer') {
      if (registrationExpense == 'Dealer') {
        return (facilitatingCharges +
            fastTag +
            gprsActivation +
            radiumStrips +
            rtoReceipts +
            rtoTax! +
            insurance! +
            hsrp +
            crtemp+ otherCharges!);
      } else {
        return (insurance! + hsrp + crtemp+ otherCharges!);
      }
    } else {
      if (registrationExpense == 'Dealer') {
        return (facilitatingCharges +
            fastTag +
            gprsActivation +
            radiumStrips +
            rtoReceipts +
            rtoTax! +
            hsrp +
            crtemp+ otherCharges!);
      } else {
        return (hsrp + crtemp+ otherCharges!);
      }
    }
  }
};

var finalCharge = (){return (totalCharges + price);};