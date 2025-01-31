import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/project_slider.dart';

import '../../../../core/routes_manager.dart';
import '../../Custom_appbar.dart';

class ProjectDetails extends StatelessWidget {
  final int index;
  const ProjectDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: const CustomAppbar(titleAppbar: 'PROJECT DETAILS'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10,),
          child: Column(
            children: [
              ProjectSlider(),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white24,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Project name',
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Center(
                            child: Text(
                              'A smart educational platform that combines the latest distance learning technologies with an outstanding interactive design.',
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
          )
            ],

          ),
        ),
      ),
    );
  }
}
