import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/src/components/molecules/feed_item.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:instagram/src/objects/feed.dart';
import 'package:provider/src/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _atualUser;
  @override
  Widget build(BuildContext context) {
    _atualUser = context.read<AtualUser>().username;
    return builderListView();
  }

  Widget builderListView() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        _getShortDesc(),
      ],
    );
  }

  Widget _getShortDesc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 72,
            width: 72,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://raw.githubusercontent.com/MestreDNS/instagram_dns_public/main/profiles/$_atualUser.png",
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          Column(
            children: const [
              Text("0"),
              Text("Publicações"),
            ],
          ),
          Column(
            children: const [
              Text("45"),
              Text("Seguidores"),
            ],
          ),
          Column(
            children: const [
              Text("36"),
              Text("Seguindo"),
            ],
          )
        ],
      ),
    );
  }
}
