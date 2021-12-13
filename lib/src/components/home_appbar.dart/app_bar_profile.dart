import 'package:flutter/material.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:instagram/src/theme/colors.dart';
import 'package:provider/provider.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final String _atualUser = context.read<AtualUser>().username;
    return AppBar(
      backgroundColor: MyThemeColors.black,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(_atualUser),
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
      ],
    );
  }
}
