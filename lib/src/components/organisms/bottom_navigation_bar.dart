import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/globals.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:instagram/src/theme/colors.dart';
import 'package:provider/provider.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  List<BottomNavigationBarItem> _bnbItems = [];

  void generateBNBItems() {
    final String _atualUser = context.watch<AtualUser>().username;
    _bnbItems = [
      getBNBItem(
        "assets/instagram/white/instagram_home_pano_outline_24.png",
        "assets/instagram/white/instagram_home_pano_filled_24.png",
      ),
      getBNBItem(
        "assets/instagram/white/instagram_search_pano_outline_24.png",
        "assets/instagram/white/instagram_search_pano_filled_24.png",
      ),
      getBNBItem(
        "assets/instagram/white/instagram_reels_pano_outline_24.png",
        "assets/instagram/white/instagram_reels_pano_filled_24.png",
      ),
      getBNBItem(
        "assets/instagram/white/instagram_shopping_bag_pano_outline_24.png",
        "assets/instagram/white/instagram_shopping_bag_pano_filled_24.png",
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 32,
          width: 32,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://raw.githubusercontent.com/MestreDNS/instagram_dns_public/main/profiles/$_atualUser.png",
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        label: "",
      )
    ];
  }

  BottomNavigationBarItem getBNBItem(String _icon, String _activeIcon) {
    return BottomNavigationBarItem(
      activeIcon: Image.asset(
        _activeIcon,
        width: 24.0,
        height: 24.0,
      ),
      icon: Image.asset(
        _icon,
        width: 24.0,
        height: 24.0,
      ),
      label: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    generateBNBItems();

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MyThemeColors.white,
            blurRadius: 1,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        items: _bnbItems,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: MyThemeColors.black,
        currentIndex: Globals.pageIndex,
        elevation: 1,
        onTap: (_index) {
          setState(() {
            Globals.pageIndex = _index;
          });
        },
      ),
    );
  }
}
