import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/theme/colors.dart';

class FeedItem extends StatelessWidget {
  final String username;
  final String imagePostPath;

  const FeedItem(this.username, this.imagePostPath, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        children: [
          title(username),
          const SizedBox(height: 8.0),
          image(imagePostPath, screenWidth),
          actions(),
          likedBy(["mestre_dns", "loginn", "syscheater"], screenWidth),
          const SizedBox(height: 4.0),
          newComment(screenWidth),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }

  Row title(String username) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: MyThemeColors.storyBorderColor2,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://raw.githubusercontent.com/MestreDNS/instagram_dns_accounts/main/profiles/$username.png",
                ),
                radius: 16.0,
              ),
            ),
          ),
        ),
        Text(username)
      ],
    );
  }

  Image image(String _imagePath, double _screenWidth) {
    return Image(
      image: AssetImage(_imagePath),
      width: _screenWidth,
      fit: BoxFit.fitWidth,
    );
  }

  Padding actions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              feedIcon(
                "assets/instagram/white/instagram_heart_pano_outline_24.png",
              ),
              feedIcon(
                "assets/instagram/white/instagram_comment_pano_outline_24.png",
              ),
              feedIcon(
                "assets/instagram/white/instagram_direct_pano_outline_24.png",
              ),
            ],
          ),
          Row(
            children: [
              feedIcon(
                "assets/instagram/white/instagram_save_pano_outline_24.png",
              ),
            ],
          )
        ],
      ),
    );
  }

  IconButton feedIcon(String _imagePath) {
    return IconButton(
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      onPressed: () {},
      icon: Image.asset(
        _imagePath,
        width: 24.0,
        height: 24.0,
      ),
    );
  }

  Container likedBy(List<String> _users, double _screenWidth) {
    final Random otherViewed = Random();
    int otherViewedCount = 0;
    final bool otherViewedBool = otherViewed.nextBool();
    if (otherViewedBool) {
      otherViewedCount = otherViewed.nextInt(200);
    }
    final StringBuffer _textBuffer = StringBuffer("Curtido por ");
    int _index = 0;
    for (final String _user in _users) {
      _textBuffer.write(_user);
      if (_index == _users.length - 1) {
        break;
      } else if (_users.length == 1) {
        break;
      } else if (_index == _users.length - 2) {
        if (!otherViewedBool) {
          _textBuffer.write(" e ");
        } else {
          _textBuffer.write(", ");
        }
      } else {
        _textBuffer.write(", ");
      }
      _index++;
    }
    if (otherViewedBool) {
      _textBuffer.write(" e outras $otherViewedCount pessoas");
    }
    return Container(
      width: _screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(text: _textBuffer.toString()),
      ),
    );
  }

  SizedBox newComment(double _screenWidth) {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://raw.githubusercontent.com/MestreDNS/instagram_dns_accounts/main/profiles/$username.png",
              ),
              radius: 16.0,
            ),
          ),
          const Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Adicione um comentário...',
              ),
            ),
          )
        ],
      ),
    );
  }
}
