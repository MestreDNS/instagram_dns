import 'package:flutter/material.dart';
import 'splash_page.dart';

class InstagramDNS extends StatelessWidget {
  const InstagramDNS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram DNS',
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
      },
    );
  }
}
