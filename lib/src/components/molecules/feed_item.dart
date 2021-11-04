import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title("mage_cat"),
          const SizedBox(height: 8.0),
          image("mage_cat", screenWidth),
          actions(),
        ],
      ),
    );
  }

  Row title(String username) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/profiles/$username.jpg"),
            radius: 16.0,
          ),
        ),
        Text(username)
      ],
    );
  }

  Image image(String username, double _screenWidth) {
    return Image(
      image: AssetImage("assets/images/profiles/$username.jpg"),
      width: _screenWidth,
      fit: BoxFit.fitWidth,
    );
  }

  Padding actions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/instagram/white/instagram_heart_pano_outline_24.png",
              width: 24.0,
              height: 24.0,
            ),
          ),
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
              "assets/instagram/white/instagram_app_messenger_pano_outline_24.png",
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
