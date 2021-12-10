import 'dart:convert';
import 'package:http/http.dart' as http;

class FeedObject {
  final String username;
  final List<int> feedList;

  const FeedObject({
    required this.username,
    required this.feedList,
  });

  factory FeedObject.fromJson(Map<String, dynamic> json) {
    List x = json['feed'] as List;
    List<int> y = List<int>.from(x);
    return FeedObject(
      username: json['username'] as String,
      feedList: y as List<int>,
    );
  }

  static Future<List<FeedObject>> fetchFeed(http.Client client) async {
    final response = await client.get(
      Uri.parse(
        'https://raw.githubusercontent.com/MestreDNS/instagram_dns_public/main/feed.json',
      ),
    );
    return parseFeed(response.body);
  }

  static List<FeedObject> parseFeed(String responseBody) {
    final parse = json.decode(responseBody);
    final data = parse as List;
    final map = data.map<FeedObject>(
      (e) => FeedObject.fromJson(e as Map<String, dynamic>),
    );
    return map.toList();
  }
}
