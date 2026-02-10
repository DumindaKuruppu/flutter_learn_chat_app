import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future<void> loginUser(String userName) async {
    try {
      _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLoggedIn() async {
    String? userName = await _prefs.getString('userName');
    return (userName != null);
  }

  void logoutUser() {
    _prefs.clear();
    notifyListeners();
  }

  getUserName() {
    return _prefs.getString('userName') ?? 'Default';
  }

  void updateUserName(String userName) {
    _prefs.setString('userName', userName);
    notifyListeners();
  }
}
