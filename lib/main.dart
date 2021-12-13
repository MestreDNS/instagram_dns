import 'package:flutter/material.dart';
import 'package:instagram/src/my_material_app.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:instagram/src/objects/home_object.dart';
import 'package:instagram/src/pages/sign_up_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AtualUser()),
        ChangeNotifierProvider(create: (_) => HomeObject())
      ],
      child: const MyMaterialApp(),
    ),
  );
}
