final users = [
  'Chetan',
  'Ravi',
  'Prajakta',
  'Swapnali',
  'Raj', //Satpute
  'Kishore',
  'Devendra',
  'Yuvraj',
  'Ayub',
  'Nirakar',
  'Rahul',
  'Satej',
];

final password = [
  'ChetanSP!',
  'RaviSP!',
  'PrajaktaSP!',
  'SwapnaliSP!',
  'RajSP!',
  'KishoreSP!',
  'DevendraSP!',
  'YuvrajSP!',
  'AyubSP!',
  'NirakarSP!',
  'RahulSP!',
  'SatejSP!',
];

userExists(String username, String password, Function success, String errorMessage){
  users.contains(username)?checkUsername(username, password, success, errorMessage) : errorMessage = 'User does not exist';
}

checkUsername(String username, String pass, Function success, String errorMessage){
  int userIndex = users.indexOf(username);
  (pass == password[userIndex])? success : errorMessage = 'Incorrect username or password';
}