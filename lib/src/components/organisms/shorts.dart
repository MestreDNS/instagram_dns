import 'package:flutter/material.dart';
import 'package:instagram/src/components/molecules/stories_item.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:provider/provider.dart';

class Shorts extends StatefulWidget {
  const Shorts({Key? key}) : super(key: key);

  @override
  _ShortsState createState() => _ShortsState();
}

class _ShortsState extends State<Shorts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: builderListView(),
    );
  }

  Widget builderListView() {
    final String _atualUser = context.read<AtualUser>().username;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        StoriesItem(_atualUser, false),
        const StoriesItem("loginn", true),
        const StoriesItem("mage_cat", false),
        const StoriesItem("system_cheater", false),
      ],
    );
  }
}
