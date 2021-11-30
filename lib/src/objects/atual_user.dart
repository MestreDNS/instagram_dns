import 'package:flutter/material.dart';

class AtualUser with ChangeNotifier {
  String _username = "mestre_dns";

  String get username => _username;

  void updateUsername(String _newUsername) {
    _username = _newUsername;
    notifyListeners();
  }
}
