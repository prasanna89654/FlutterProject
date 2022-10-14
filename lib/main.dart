import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/login.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EasySplashScreen(
          durationInSeconds: 1,
          showLoader: false,
          logo: Image.asset(
            'assets/images/care.png',
          ),
          backgroundColor: Colors.orange,
          navigator: (const LoginScreen()),
        ));
  }
}
