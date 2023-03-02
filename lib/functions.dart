int GST(int price) {
  return (price * 0.28).ceil();
}

int Cess(int price) {
  return (price * 0.2).ceil();
}

int TCS(int price, int gst, int cess) {
  return ((price + gst + cess) * 0.01).ceil();
}

int exShowroomPrice(int price, int gst, int cess, int tcs) {
  return price + gst + cess + tcs;
}

int insurance(int exShowroomPrice) {
  return (exShowroomPrice * 0.045).ceil();
}

int individualRegistrationExpense(int exShowroomPrice) {
  return (exShowroomPrice * 0.1475).ceil();
}

int corporateRegistrationExpense(int exShowroomPrice) {
  return (exShowroomPrice * 0.215).ceil();
}

int onRoadPriceIndividual(
    int exShowroomPrice, int insurance, int individualRegistrationExpense) {
  return exShowroomPrice + insurance + individualRegistrationExpense;
}

int onRoadPriceCorporate(
    int exShowroomPrice, int insurance, int corporateRegistrationExpense) {
  return exShowroomPrice + insurance + corporateRegistrationExpense;
}

int finalOnRoadPrice(int exShowroomPrice, int insurance, int registrationExpense, int accessoryTotal, int discount){
  return exShowroomPrice+insurance+registrationExpense+accessoryTotal-discount;
}