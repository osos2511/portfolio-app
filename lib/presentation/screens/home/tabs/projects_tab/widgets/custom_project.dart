import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/routes_manager.dart';
import 'package:info_tech/data/model/projects/Project.dart';

class CustomProject extends StatelessWidget {
  final Project project;
  final String image;
  final String title;
  final num index;

  const CustomProject({
    Key? key,
    required this.project,
    required this.title,
    required this.image,
    required this.index,
  }) : super(key: key);

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
        width: screenWidth * 0.8,
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
                          height: screenHeight * 0.45,
                          width: double.infinity,
                          color: ColorsManager.mainAppColor,
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.fill,
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.mainAppColor,
                        ),
                        onPressed: () {
                          print("Passing project ID: ${project.id}"); // تحقق من وجود id
                          Navigator.pushNamed(
                            context,
                            RoutesManager.projectDetailsRoute,
                            arguments: index,
                          );
                        },
                        child: Text(
                          'تفاصيل أكثر',
                          style: GoogleFonts.alexandria(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      )
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
