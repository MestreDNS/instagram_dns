import 'package:flutter/material.dart';
import 'package:instagram/src/my_material_app.dart';
import 'package:instagram/src/objects/atual_user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AtualUser()),
      ],
      child: const MyMaterialApp(),
    ),
  );
}
