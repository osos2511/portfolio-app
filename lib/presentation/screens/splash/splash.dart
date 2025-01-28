import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes_manager.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double responsiveFontSize(BuildContext context, double baseFontSize) {
      return screenWidth * (baseFontSize / 375);
    }

    return Scaffold(
      backgroundColor: Color(0xff171D2B),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  ScaleAnimatedText(
                    'INFO  TECH',
                    textStyle: GoogleFonts.rubikVinyl(
                      color: Colors.white,
                      fontSize: responsiveFontSize(context, 60),
                      fontWeight: FontWeight.w600,
                    ),
                    duration: const Duration(seconds: 4),
                  ),
                  ScaleAnimatedText(
                    'YOUR BEST PORTFOLIO',
                    textStyle: GoogleFonts.exo2(
                      color: Colors.white,
                      fontSize: responsiveFontSize(context, 30),
                      fontWeight: FontWeight.w600,
                    ),
                    duration: const Duration(seconds: 4),
                  ),
                ],
                onFinished: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesManager.loginRoute);
                },
              ),
            ),
            const Spacer(),
            SpinKitPianoWave(
              color: Colors.white,
              size: screenWidth * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}