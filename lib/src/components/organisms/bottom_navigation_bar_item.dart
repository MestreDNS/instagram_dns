import 'package:flutter/material.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  final List<BottomNavigationBarItem> _bnbItems = [];

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(items: _bnbItems);
  }
}
