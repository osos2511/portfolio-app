import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/constants/result.dart';
import 'package:info_tech/data/api_manager/api_manager.dart';
import 'package:info_tech/data/model/projects/Project.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/custom_icon_container.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/project_slider.dart';
import '../../Custom_appbar.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? projectId = ModalRoute.of(context)?.settings.arguments as int?;
    print("Project ID received: $projectId");

    if (projectId == null) {
      return Scaffold(
        appBar:  CustomAppbar(titleAppbar: 'PROJECT DETAILS'),
        backgroundColor: ColorsManager.mainAppColor,
        body: const Center(child: Text("Project ID is missing")),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar:  CustomAppbar(titleAppbar: 'تفاصيل المشروع'),
      body: FutureBuilder<Result<Project>>(
        future: ApiManager.getProjectDetails(projectId),
        builder: (context, snapshot) {
          print("Connection state: ${snapshot.connectionState}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Snapshot error: ${snapshot.error}");
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          } else {
            final result = snapshot.data!;
            if (result is Success<Project>) {
              final project = result.data;
              return Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProjectSlider(images: project.images),
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
                                          project.title ?? "No Title",
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
                                          project.descriptions ?? "No Description",
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
                                        child: CustomIconList(), // تأكد من وجود هذا الودجت
                                      ),
                                      // يمكنك إضافة المزيد من التفاصيل هنا مثل المطورين أو معلومات إضافية
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
              );
            } else if (result is ServerError<Project>) {
              return Center(child: Text("Server Error: ${result.message}"));
            } else if (result is Error<Project>) {
              return Center(child: Text("Error: ${result.exception}"));
            } else {
              return const Center(child: Text("Unknown error"));
            }
          }
        },
      ),
    );
  }
}
