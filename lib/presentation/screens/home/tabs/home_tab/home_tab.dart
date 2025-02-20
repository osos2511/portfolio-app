import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/routes_manager.dart';
import 'package:info_tech/presentation/screens/Custom_appbar.dart';
import 'package:info_tech/presentation/screens/home/tabs/home_tab/widgets/custom_home_container.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: CustomAppbar(titleAppbar: 'الرئيسية '),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight*0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                CustomHomeContainer(
                    image: AssetsManager.ob3, text: 'التصميم'),
                Spacer(),
                CustomHomeContainer(
                    image: AssetsManager.ob2, text: 'التطوير'),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: double.infinity,
              height: screenHeight * 0.32,
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: ColorsManager.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AssetsManager.ob2,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "جميع الخدمات",
                          style: GoogleFonts.pottaOne(
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.mainAppColor,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "تطوير موبايل/ويب \n"
                          "تصميم موبايل /ويب \n"
                          "تعديل موبايل / ويب \n"
                          "هندسه برمجيات \n"
                          "منشورات تواصل اجتماعي ",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesManager.messageTabRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(double.infinity, screenHeight * 0.05),
                            backgroundColor: ColorsManager.mainAppColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'قبول',
                                style: GoogleFonts.poppins(
                                  color: ColorsManager.yellow,
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: ColorsManager.yellow,
                                size: screenWidth * 0.05,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
