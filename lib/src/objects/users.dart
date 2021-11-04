// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';

import 'package:flutter/services.dart';

class Users {
  static Future<List<Map<String, dynamic>>>? getUsers() async {
    final String response =
        await rootBundle.loadString('assets/datasets/users.json');
    final Map<String, List<Map<String, dynamic>>> data =
        await json.decode(response) as Map<String, List<Map<String, dynamic>>>;
    final Future<List<Map<String, dynamic>>> usersData =
        data["users"]! as Future<List<Map<String, dynamic>>>;
    return usersData;
  }
}
