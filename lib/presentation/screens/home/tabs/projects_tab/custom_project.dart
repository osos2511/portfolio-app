import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/routes_manager.dart';
import '../../../../../core/colors_manager.dart';

class CustomProject extends StatelessWidget {
  const CustomProject({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        right: screenWidth * 0.1,
        left: screenWidth * 0.1,
        bottom: screenHeight * 0.1,
      ),
      child: SizedBox(
        width: screenWidth*0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: double.infinity,
                color: Colors.white24,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: screenHeight * 0.35,
                          width: double.infinity,
                          color: ColorsManager.mainAppColor,
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),

                      Center(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                            color: ColorsManager.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      Center(
                        child: Text(
                          description,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context,RoutesManager.projectDetailsRoute);
                            },
                            child: Text(
                              'more details',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.04,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.deepPurpleAccent,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'live preview',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.04,
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.orangeAccent,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
