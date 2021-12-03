import 'package:flutter/material.dart';
import 'package:instagram/src/pages/login_page.dart';
import 'package:instagram/src/pages/sign_in_page.dart';
import 'package:instagram/src/pages/sign_up_page.dart';
import 'pages/home_page.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
