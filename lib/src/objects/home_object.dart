import 'dart:async';

import 'package:flutter/material.dart';

class HomeObject with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void updateIndex(int _newIndex) {
    _index = _newIndex;
    notifyListeners();
  }
}
