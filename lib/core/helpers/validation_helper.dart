extension ExtString on String {
  static bool isValidEmail(String email) {
    return  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isValidName(String name){
    return RegExp(r"^\s*([A-Za-z]{1,}([.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(name);
  }

  static bool isValidPassword(String password){
    return RegExp(r"^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[#@$!%?&])[A-Za-z\d#@$!%?&]{8,}$").hasMatch(password);
  }


  static bool isValidPhone(String phone){
    return RegExp(r"^\+?0[0-9]{10}$").hasMatch(phone);
  }

}