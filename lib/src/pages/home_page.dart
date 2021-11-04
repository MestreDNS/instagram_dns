import 'package:flutter/material.dart';
import 'package:instagram/src/components/organisms/app_bar.dart';
import 'package:instagram/src/components/organisms/bottom_navigation_bar.dart';
import 'package:instagram/src/components/organisms/feed.dart';
import 'package:instagram/src/components/organisms/shorts.dart';
import 'package:instagram/src/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: MyThemeColors.primary,
      bottomNavigationBar: const BNB(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Shorts(),
            SizedBox(
              height: 8.0,
            ),
            Feed(),
          ],
        ),
      ),
    );
  }
}
