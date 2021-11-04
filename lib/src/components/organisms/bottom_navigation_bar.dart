import 'package:flutter/material.dart';
import 'package:instagram/src/globals.dart';
import 'package:instagram/src/theme/colors.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  List<BottomNavigationBarItem> _bnbItems = [];

  void generateBNBItems() {
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
      const BottomNavigationBarItem(
        icon: SizedBox(
          height: 32,
          width: 32,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/profiles/mestre_dns.jpg",
            ),
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
