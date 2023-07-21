import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_flutter/controller/fetchMeme.dart';
import 'package:meme_flutter/controller/saveMyData.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imageUrl =
      "https://images.theconversation.com/files/521751/original/file-20230419-18-hg9dc3.jpg?ixlib=rb-1.1.0&rect=53%2C17%2C1898%2C949&q=45&auto=format&w=1356&h=668&fit=crop";

  int? memeNo;
  bool isLoading = false;
  int targetMeme = 50;

// The INIT State
  @override
  void initState() {
    super.initState();
    GetInitMemeNo();
  }

// Getting meme number from device storage
  GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 1;

    if (memeNo! >= 50) {
      targetMeme = 100;
    } else if (memeNo! >= 100) {
      targetMeme = 1600;
    }

    setState(() {});
  }

// Function to update Image
  void updateImage() async {
    String getimageUrl = await FetchMeme.fetchnewMeme();
    setState(() {
      imageUrl = getimageUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const nextMeme = [
      Colors.red,
      Colors.black,
      Colors.yellowAccent,
      Colors.yellow,
      Color.fromARGB(255, 234, 210, 0),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 234, 220, 180),
              Color.fromARGB(255, 237, 218, 160),
              Color.fromARGB(255, 239, 214, 137),
              Color.fromARGB(255, 240, 210, 117),
              Color.fromARGB(255, 240, 204, 95),
              Color.fromARGB(255, 239, 200, 83),
              Colors.amber,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 130),
            // Current Meme number
            Text(
              'Meme #$memeNo',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 57, 18, 16)),
            ),
            const SizedBox(height: 5),
            // Target meme number
            Text(
              'Target #$targetMeme',
              style: const TextStyle(
                  fontSize: 35, fontWeight: FontWeight.w700, color: Colors.red),
            ),
            const SizedBox(height: 7),

            // Image Being Displayed
            isLoading
                ? Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: SizedBox(
                          height: 60,
                          width: 50,
                          child: CircularProgressIndicator()),
                    ),
                  )
                : Image.network(
                    imageUrl,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight,
                  ),

            // NEXT MEME Button
            TextButton(
              onPressed: () async {
                print('Next Meme Tapped..........................');
                updateImage();
                //FetchMeme().fetchnewMeme();
                await SaveMyData.saveData(memeNo! + 1);
                GetInitMemeNo();
                setState(() {
                  isLoading = true;
                });
              },
              //child: Text('Next Meme')
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Next Meme',
                    //textAlign: TextAlign.center,
                    textStyle: GoogleFonts.indieFlower(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    colors: nextMeme,
                    speed: const Duration(milliseconds: 300),
                  ),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 1000,
              ),
            ),

            // Ending titles
            const Spacer(),
            Text(
              'App created by',
              style: GoogleFonts.domine(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 234, 59, 46)),
            ),
            Text(
              'AKS',
              style: GoogleFonts.domine(
                  fontSize: 18, color: const Color.fromARGB(255, 243, 60, 47)),
            ),
          ],
        ),
      ),
    );
  }
}
