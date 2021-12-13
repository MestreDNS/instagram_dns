import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/src/components/molecules/feed_item.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:instagram/src/objects/feed.dart';
import 'package:provider/src/provider.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<FeedItem> feedList = [];
  @override
  Widget build(BuildContext context) {
    final String _atualUser = context.read<AtualUser>().username;
    return FutureBuilder<List<FeedItem>>(
      future: _getFeed(_atualUser),
      builder: (BuildContext context, AsyncSnapshot<List<FeedItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return const Center(
              child: Text("deu erro :("),
            );
          } else {
            return builderListView(snapshot.data);
          }
        }
      },
    );
  }

  Widget builderListView(List<FeedItem>? feedList) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: feedList ??
          [
            const Center(
              child: Text("deu erro :("),
            )
          ],
    );
  }

  Future<List<FeedItem>> _getFeed(String _atualUser) async {
    List<FeedObject> feedObjectList = [];
    await FeedObject.fetchFeed(http.Client()).then((x) => feedObjectList = x);
    feedList = [];
    final List<int> sortedTimestamp = [];
    for (final FeedObject feedObjectItem in feedObjectList) {
      for (int i = 0; i < feedObjectItem.feedList.length; i++) {
        sortedTimestamp.add(
          feedObjectItem.feedList[i],
        );
      }
    }
    sortedTimestamp.sort();
    for (int i = 0; i < sortedTimestamp.length; i++) {
      for (final FeedObject feedObjectItem in feedObjectList) {
        for (int i2 = 0; i2 < feedObjectItem.feedList.length; i2++) {
          if (feedObjectItem.feedList[i2] == sortedTimestamp[i]) {
            feedList.add(
              FeedItem(feedObjectItem.username, feedObjectItem.feedList[i2]),
            );
            break;
          }
        }
      }
    }
    return feedList;
  }
}
