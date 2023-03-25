class Urbania{
  List<String> model = [
    'Urbania (10 Seats + Driver)',
    'Urbania (13 Seats + Driver)',
    'Urbania (17 Seats + Driver)',
  ];

  List<String> colors = [
    'White',
    'Blue',
  ];

  List<int> price = [
    2950000,
    2899000,
    3125000,
  ];

  List<String> rtoTax = [
    '20000', //under PPRS Passing
    '84500',
    '110500'
  ];

  //HSRP = 1500

  int insurance(int price){
    return price*0.0215.ceil();
  }


}