import 'package:flutter/material.dart';
import 'package:instagram/src/components/organisms/feed.dart';
import 'package:instagram/src/components/organisms/shorts.dart';

const List<Widget> feedBody = [
  Shorts(),
  SizedBox(
    height: 8.0,
  ),
  Feed(),
];
