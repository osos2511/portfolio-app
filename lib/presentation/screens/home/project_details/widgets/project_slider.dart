import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/constants/result.dart';
import 'package:info_tech/data/api_manager/api_manager.dart';
import 'package:info_tech/data/model/projects/Project.dart';
import 'package:info_tech/data/model/projects/Images.dart';
import 'package:info_tech/presentation/screens/home/project_details/widgets/custom_icon_container.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/constants/end_points.dart';
import '../../../Custom_appbar.dart';


/// ودجت عرض الصور باستخدام CarouselSlider بدون استخدام PageView أو Provider
class ProjectSlider extends StatelessWidget {
  const ProjectSlider({Key? key, required this.images}) : super(key: key);

  final List<Images>? images;

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) {
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.grey,
        child: const Center(child: Text("No Images Available")),
      );
    }
    return CarouselSlider.builder(
      itemCount: images!.length,
      itemBuilder: (context, index, realIndex) {
        final currentItem = images![index];
        const defaultImage = AssetsManager.ob1;
        final imagePath = currentItem.image;
        final imageUrl = (imagePath != null && imagePath.isNotEmpty)
            ? "http://${EndPoints.host}/storage/$imagePath"
            : defaultImage;
        return Container(
          width: double.infinity,
          height: 300,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey,
              child: const Center(child: Text("Image Not Available")),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        autoPlay: false,
        viewportFraction: 1,
      ),
    );
  }
}

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
      appBar:  CustomAppbar(titleAppbar: 'PROJECT DETAILS'),
      body: FutureBuilder<Result<Project>>(
        future: ApiManager.getProjectDetails(projectId),
        builder: (context, snapshot) {
          print("Connection state: ${snapshot.connectionState}");
          // حالة الانتظار
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            print("Snapshot error: ${snapshot.error}");
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          // في حال عدم وجود بيانات
          else if (!snapshot.hasData) {
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
                      // عرض الصور باستخدام ProjectSlider
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
                                          project.descriptions ??
                                              "No Description",
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
                                      // Text(
                                      //   "Developed by",
                                      //   style: GoogleFonts.poppins(
                                      //       fontSize: 25,
                                      //       color: ColorsManager.white,
                                      //       fontWeight: FontWeight.w500),
                                      // ),
                                      // const SizedBox(height: 20),
                                      // CustomDeveloperContainer(
                                      //   name: 'Hossam Hassan',
                                      //   role: 'Flutter Developer',
                                      // ),

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
