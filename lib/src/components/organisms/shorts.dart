import 'package:flutter/material.dart';
import 'package:instagram/src/components/molecules/stories_item.dart';

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
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        StoriesItem("mestre_dns", false),
        StoriesItem("loginn", true),
        StoriesItem("mage_cat", false),
        StoriesItem("system_cheater", true),
        StoriesItem("mestre_dns", false),
        StoriesItem("mestre_dns", false),
        StoriesItem("mestre_dns", true),
      ],
    );
  }
}
