import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      width: 128,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title("mage_cat"),
          image("mage_cat"),
        ],
      ),
    );
  }

  Row title(String username) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage("assets/images/profiles/$username.jpg")),
        Text(username)
      ],
    );
  }

  Image image(String username) {
    return Image(image: AssetImage("assets/images/profiles/$username.jpg"));
  }
}
