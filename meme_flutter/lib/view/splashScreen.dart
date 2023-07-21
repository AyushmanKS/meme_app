import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    const memeStream = [
      Colors.purple,
      Colors.black,
      Color(0xffc6a75f),
      Colors.yellowAccent,
      Colors.yellow,
      Color.fromARGB(255, 234, 210, 0),
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 203, 193, 171),
              Color.fromARGB(255, 198, 185, 155),
              Color.fromARGB(255, 195, 176, 134),
              Color.fromARGB(255, 201, 177, 121),
              Color(0xffc6a75f),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: 20),
            Image.asset('assets/images/logo-modified.png'),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'MemeStream',
                  //textAlign: TextAlign.center,
                  textStyle: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  colors: memeStream,
                  speed: const Duration(milliseconds: 300),
                ),
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
