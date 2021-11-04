import 'package:flutter/material.dart';
import 'package:instagram/src/theme/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyThemeColors.black,
      title: Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 8.0),
        child: Image.asset(
          "assets/instagram/logo/nux_dayone_landing_logo.png",
          height: 32,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/instagram/white/instagram_new_post_pano_outline_24.png",
            width: 24.0,
            height: 24.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/instagram/white/instagram_heart_pano_outline_24.png",
            width: 24.0,
            height: 24.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/instagram/white/instagram_app_messenger_pano_outline_24.png",
            width: 24.0,
            height: 24.0,
          ),
        ),
      ],
    );
  }
}
