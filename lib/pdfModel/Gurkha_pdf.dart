class gurkhaPdf{
  String? name;
  String? city;
  int? number;
  String? email;
  String? RefId;
  String? date;
  String? BankHP;
  String? Model;
  String? color;
  int? basicPrice;
  int? gst;
  int? cess;
  int? tcs;
  int? exShowroomPrice;
  int? insurance;
  int? individualRegistration;
  int? corporateRegistration;
  int? individualOnRoad;
  int? corporateOnRoad;
  List<AccessoryCost>? accCost;
  int? finalAccessoryCost;
  gurkhaPdf(this.corporateOnRoad, this.individualOnRoad, this.insurance, this.exShowroomPrice, this.gst, this.cess, this.tcs, this.basicPrice, this.date, this.city, this.name, this.color, this.accCost, this.BankHP, this.corporateRegistration, this.email, this.individualRegistration, this.Model, this.number, this.RefId,);
}

class AccessoryCost {
  String? Accessory;
  int? price;

  AccessoryCost(this.Accessory, this.price);
}