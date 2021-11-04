import 'package:flutter/material.dart';
import 'package:instagram/src/components/molecules/feed_item.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: builderListView(),
    );
  }

  Widget builderListView() {
    return ListView(
      shrinkWrap: true,
      children: const [
        FeedItem(),
      ],
    );
  }
}
