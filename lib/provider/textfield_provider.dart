import 'package:flutter/widgets.dart';

class TextFieldProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _gender = '';


  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get gender => _gender;


  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updatePhone(String newPhone) {
    _phone = newPhone;
    notifyListeners();
  }

  void updateGender(String newGender) {
    _gender = newGender;
    notifyListeners();
  }
}