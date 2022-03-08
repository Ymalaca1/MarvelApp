import 'package:flutter/cupertino.dart';
import '../model/export_model.dart';

class UserController with ChangeNotifier {
  late User _currentUser;
  User get currentUser => _currentUser;
  late String _name;

  //setting variable name
  void setName(String nameP) {
    _name = nameP;
  }

  //creating a new user from the given name
  void setUser() {
    _currentUser = User(userName: _name);
    notifyListeners();
  }
}
