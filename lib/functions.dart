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