import 'package:flutter/material.dart';

class InstagramLogo extends StatelessWidget {
  final EdgeInsets padding;
  const InstagramLogo({
    Key? key,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        "assets/instagram/logo/nux_dayone_landing_logo.png",
        width: 160.0,
      ),
    );
  }
}
