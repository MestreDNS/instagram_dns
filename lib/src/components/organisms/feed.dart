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
      child: builderListView(),
    );
  }

  Widget builderListView() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: const [
        FeedItem("mage_cat", "assets/images/upload/nina.jpg"),
        FeedItem("loginn", "assets/images/upload/kurumins.jpg"),
        FeedItem("mestre_dns", "assets/images/upload/me_and_cats.jpg"),
      ],
    );
  }
}
