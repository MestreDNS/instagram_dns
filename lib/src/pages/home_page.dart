import 'package:flutter/material.dart';
import 'package:instagram/src/components/home_appbar.dart/app_bar_profile.dart';
import 'package:instagram/src/components/home_body/feed_body.dart';
import 'package:instagram/src/components/home_body/profile_body.dart';
import 'package:instagram/src/components/home_body/reels_body.dart';
import 'package:instagram/src/components/home_body/search_body.dart';
import 'package:instagram/src/components/home_body/shop_body.dart';
import 'package:instagram/src/components/home_appbar.dart/app_bar_feed.dart';
import 'package:instagram/src/components/organisms/bottom_navigation_bar.dart';
import 'package:instagram/src/components/organisms/feed.dart';
import 'package:instagram/src/components/organisms/shorts.dart';
import 'package:instagram/src/objects/home_object.dart';
import 'package:instagram/src/theme/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context.watch<HomeObject>().index),
      backgroundColor: MyThemeColors.primary,
      bottomNavigationBar: const BNB(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _getBody(context.watch<HomeObject>().index),
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppBar(_index) {
    switch (_index) {
      case 4:
        return AppBarProfile();
      default:
        return AppBarFeed();
    }
  }

  List<Widget> _getBody(_index) {
    switch (_index) {
      case 1:
        return searchBody;
      case 2:
        return reelsBody;
      case 3:
        return shopBody;
      case 4:
        return profileBody;
      default:
        return feedBody;
    }
  }
}
