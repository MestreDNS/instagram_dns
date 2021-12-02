import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instagram/src/objects/atual_user.dart';

class UserLogin {
  final String username;
  final String? email;
  final int? phone;
  final String password;

  const UserLogin({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      username: json['username'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as int?,
      password: json['pass'] as String,
    );
  }

  static Future<List<UserLogin>> fetchUserLogin(http.Client client) async {
    final response = await client.get(
      Uri.parse(
        'https://raw.githubusercontent.com/MestreDNS/instagram_dns_accounts/main/login.json',
      ),
    );
    return parseUserLogin(response.body);
  }

  static List<UserLogin> parseUserLogin(String responseBody) {
    final parse = json.decode(responseBody);
    final data = parse as List;
    final map = data
        .map<UserLogin>((e) => UserLogin.fromJson(e as Map<String, dynamic>));
    return map.toList();
  }

  static Future<String?> checkLogin(
    String userCheck,
    String passCheck,
  ) async {
    List<UserLogin> userLoginList = [];
    await UserLogin.fetchUserLogin(http.Client())
        .then((x) => userLoginList = x);
    for (final UserLogin user in userLoginList) {
      if (user.username == userCheck ||
          user.email == userCheck ||
          user.phone.toString() == userCheck && user.password == passCheck) {
        return user.username;
      }
    }
    print("dados invalidos");
  }
}
