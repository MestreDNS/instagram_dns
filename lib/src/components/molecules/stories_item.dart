import 'package:flutter/material.dart';
import 'package:instagram/src/theme/colors.dart';

class StoriesItem extends StatelessWidget {
  final String username;
  final bool viewed;
  const StoriesItem(this.username, this.viewed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Container(
            width: 82,
            height: 82,
            padding:
                viewed ? const EdgeInsets.all(0.8) : const EdgeInsets.all(2.0),
            decoration: shortsBoxDecoration(),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyThemeColors.black,
              ),
              child: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/profiles/$username.jpg"),
                radius: 72,
              ),
            ),
          ),
          SizedBox(
            width: 82,
            child: RichText(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: TextStyle(
                  color: viewed ? Colors.grey : Colors.white,
                  fontSize: 12,
                ),
                text: username,
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration shortsBoxDecoration() {
    if (viewed) {
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      );
    } else {
      return const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: MyThemeColors.storyBorderColor2,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      );
    }
  }
}
