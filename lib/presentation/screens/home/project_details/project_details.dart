import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/custom_developer_container.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/custom_icon_container.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/project_slider.dart';
import '../../Custom_appbar.dart';

class ProjectDetails extends StatelessWidget {
  final int index;
  const ProjectDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: const CustomAppbar(titleAppbar: 'PROJECT DETAILS'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
               ProjectSlider(),
              const SizedBox(height: 20),
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


                              SizedBox(
                                height: 100,
                                child: CustomIconList(),
                              ),

                              Text("Developed by",style: GoogleFonts.poppins(fontSize: 25,color: ColorsManager.white,fontWeight: FontWeight.w500),),
                              SizedBox(height: 20,),

                              CustomDeveloperContainer(name: 'Hossam Hassan', role: 'Flutter Developer',),
                              SizedBox(height: 15,),
                              CustomDeveloperContainer(name: 'Osama Mohamed', role: 'Flutter Developer',),
                              SizedBox(height: 15,),
                              CustomDeveloperContainer(name: 'Mohamed Helmy', role: 'Backend Developer',),
                              SizedBox(height: 15,),
                              CustomDeveloperContainer(name: 'Mostafa Khaled', role: 'Frontend Developer',),
                              SizedBox(height: 15,),
                              CustomDeveloperContainer(name: 'Youssef islam', role: 'UI/UX Designer',),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
