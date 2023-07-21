import 'package:flutter/material.dart';
import 'package:meme_flutter/view/mainScreen.dart';
import 'package:meme_flutter/view/splashScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSplash = true;

  showSplashScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    showSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: showSplash ? const SplashScreen() : MainScreen());
  }
}
