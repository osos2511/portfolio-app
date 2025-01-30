import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/colors_manager.dart';
import '../../../../provider/page_controller.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ABOUT US',
          style: GoogleFonts.alexandria(
            color: ColorsManager.mainAppColor,
            fontSize: screenHeight * 0.035,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorsManager.yellow,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<PageControllerProvider>().jumpToPage(4);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 33,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white24,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Info Tech',
                    style: GoogleFonts.alexandria(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We are a team of tech innovators who turn technological challenges into exceptional opportunities. Every member of our team has a unique passion for innovation, where we combine deep expertise with bold creativity to craft outstanding digital solutions. We believe that technology is not just code, but a language of change and inspiration. We constantly strive to push beyond traditional boundaries, exploring new horizons in the tech world. Our team represents a unique blend of innovative and enthusiastic minds, where we turn bold ideas into tangible realities. We believe in the power of collaboration and thinking outside the box, and we always strive to make a positive impact through the innovative technological solutions we provide.',                    textAlign: TextAlign.center,
                    style: GoogleFonts.alexandria(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<PageControllerProvider>().jumpToPage(3);
                    },
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
