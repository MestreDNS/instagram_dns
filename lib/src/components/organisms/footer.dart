import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/src/theme/colors.dart';

class Footer {
  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: const BoxDecoration(
        color: appFooterColor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/home_active_icon.svg",
            width: 27,
          ),
        ],
      ),
    );
  }
}
