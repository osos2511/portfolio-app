import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/routes_manager.dart';
import 'package:info_tech/presentation/screens/onboarding/widgets/onboarding_image.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  Widget dotpageview() {
    return Builder(builder: ((context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: i == pageNumber ? 25 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: i == pageNumber ? Colors.white : Colors.yellow,
              ),
            ),
        ],
      );
    }));
  }

  PageController nextPage = PageController();
  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171D2B),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pageNumber = value;
          });
        },
        controller: nextPage,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 10, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(RoutesManager.homeRoute);
                      },
                      child: const Text(
                        "تخطي",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const OnboardingImage(
                  imagePath: AssetsManager.ob1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "مرحبا",
                  style: GoogleFonts.lilyScriptOne(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.yellow),
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        nextPage.animateToPage(1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.arrow_forward, size: 30),
                      ),
                    ),
                  ],
                ),
                dotpageview(),
                const Spacer(flex: 1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 66, left: 10, right: 15),
            child: Column(
              children: [
                const OnboardingImage(
                  imagePath: AssetsManager.ob2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "الخدمات",
                  style: GoogleFonts.lilyScriptOne(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.yellow),
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        nextPage.animateToPage(2,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.arrow_forward, size: 30),
                      ),
                    ),
                  ],
                ),
                dotpageview(),
                const Spacer(flex: 1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 66, left: 10, right: 15),
            child: Column(
              children: [
                const OnboardingImage(
                  imagePath: AssetsManager.ob3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "المشاريع",
                  style: GoogleFonts.lilyScriptOne(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.yellow),
                ),
                const Spacer(flex: 1),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.yellow),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
                    }, child: Text('ابدأ',style: GoogleFonts.alexandria(
                  color: const Color(0xff171D2B),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),)),
                const SizedBox(height: 30),
                dotpageview(),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
