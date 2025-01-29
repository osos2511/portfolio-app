import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/presentation/screens/home/tabs/more_tab/widgets/custom_more_container.dart';

import '../../../../../core/colors_manager.dart';

class MoreTab extends StatelessWidget {
  MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MORE',
          style: GoogleFonts.alexandria(
            color: ColorsManager.mainAppColor,
            fontSize: screenHeight * 0.035, // Responsive font size
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorsManager.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.03),
            CustomMoreContainer(text: 'Settings', icon: Icons.settings),
            SizedBox(height: screenHeight * 0.025),
            CustomMoreContainer(text: 'Your Cart', icon: Icons.shopping_cart_rounded),
            SizedBox(height: screenHeight * 0.025),
            CustomMoreContainer(text: 'About us', icon: Icons.account_box_outlined),
            SizedBox(height: screenHeight * 0.025),
            CustomMoreContainer(text: 'Our Services', icon: Icons.room_service),
            SizedBox(height: screenHeight * 0.025),
            CustomMoreContainer(text: 'Our Projects', icon: Icons.pinch_rounded),
          ],
        ),
      ),
    );
  }
}
