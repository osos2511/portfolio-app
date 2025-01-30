import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/routes_manager.dart';
import 'package:info_tech/presentation/screens/home/tabs/more_tab/widgets/custom_more_container.dart';
import '../../../../../core/colors_manager.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

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
             CustomMoreContainer(text: 'Settings', icon: Icons.settings,onTap: (){

            },),
            SizedBox(height: screenHeight * 0.025),
             CustomMoreContainer(text: 'About us', icon: Icons.account_box_outlined,onTap: (){
               Navigator.pushNamed(context, RoutesManager.aboutUsRoute);
      },),
          ],
        ),
      ),
    );
  }
}
