import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/src/components/molecules/stories_item.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:instagram/src/objects/user_login.dart';
import 'package:provider/provider.dart';

class Shorts extends StatefulWidget {
  const Shorts({Key? key}) : super(key: key);

  @override
  _ShortsState createState() => _ShortsState();
}

class _ShortsState extends State<Shorts> {
  List<StoriesItem> storiesList = [];

  @override
  Widget build(BuildContext context) {
    storiesList = [];
    final String _atualUser = context.read<AtualUser>().username;

    return FutureBuilder<List<StoriesItem>>(
      future: _getStories(_atualUser),
      builder:
          (BuildContext context, AsyncSnapshot<List<StoriesItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return const Center(
              child: Text("deu erro bixo :("),
            );
          } else {
            return builderListView();
          }
        }
      },
    );
  }

  Widget builderListView() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: storiesList,
      ),
    );
  }

  Future<List<StoriesItem>> _getStories(String _atualUser) async {
    storiesList.add(StoriesItem(_atualUser, Random().nextBool()));
    final List<String> users = await _getUserList();
    for (final String _user in users) {
      if (_user != _atualUser) {
        storiesList.add(StoriesItem(_user, Random().nextBool()));
      }
    }
    return storiesList;
  }

  Future<List<String>> _getUserList() async {
    final List<String> users = [];
    List<UserLogin> userLoginList = [];
    await UserLogin.fetchUserLogin(http.Client())
        .then((x) => userLoginList = x);
    for (final UserLogin user in userLoginList) {
      users.add(user.username);
    }
    return users;
  }
}
