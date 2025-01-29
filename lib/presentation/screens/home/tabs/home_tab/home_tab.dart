import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/page_controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HOME',
          style: GoogleFonts.alexandria(
            color: ColorsManager.mainAppColor,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorsManager.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HELLO ', style: GoogleFonts.poppins(color: ColorsManager.white, fontWeight: FontWeight.w600, fontSize: 23)),
                Text('OSAMA', style: GoogleFonts.poppins(color: ColorsManager.yellow, fontWeight: FontWeight.w600, fontSize: 23)),
              ],
            ),
            Text('What are you searching for today?', style: GoogleFonts.poppins(color: ColorsManager.white, fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 60),
            Image.asset(AssetsManager.homeImg),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFF122658), Color(0xFFC87BEA), Color(0xFFEADC78)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ).createShader(bounds);
              },
              child: Text(
                'Welcome',
                style: GoogleFonts.museoModerno(
                  fontSize: 33,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text('Let\'s start on the way to make', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18)),
            Text('professional designs!', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18)),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF142D6C), Color(0xFF0F1523)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    blurRadius: 8,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<PageControllerProvider>().jumpToPage(0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Start now with us",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
