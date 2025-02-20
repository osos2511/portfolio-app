import 'package:flutter/material.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/constants/result.dart';
import 'package:info_tech/data/api_manager/api_manager.dart';
import 'package:info_tech/data/model/projects/ProjectsResponse.dart';
import 'package:info_tech/presentation/screens/custom_appbar.dart';
import 'package:info_tech/presentation/screens/home/tabs/projects_tab/widgets/custom_project.dart';
import 'package:info_tech/core/constants/end_points.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomAppbar(titleAppbar: 'مشاريعنا'),
      backgroundColor: ColorsManager.mainAppColor,
      body: FutureBuilder<Result<ProjectsResponse>>(
        future: ApiManager.getAllProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          } else {
            final result = snapshot.data!;
            if (result is Success<ProjectsResponse>) {
              final projectsResponse = result.data;
              if (projectsResponse.data == null ||
                  projectsResponse.data!.isEmpty) {
                return const Center(child: Text("No projects available"));
              } else {
                final projects = projectsResponse.data!;
                return SizedBox(
                  height: 700,
                  child: PageView.builder(
                    itemCount: projects.length,
                    controller: PageController(viewportFraction: 1.0),
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      const defaultImage = AssetsManager.ob1;
                      final imagePath =
                      (project.images != null && project.images!.isNotEmpty)
                          ? project.images!.first.image
                          : null;
                      final image = (imagePath != null && imagePath.isNotEmpty)
                          ? "http://${EndPoints.host}/storage/$imagePath"
                          : defaultImage;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CustomProject(
                          project: project,
                          title: project.title ?? "No Title",
                          image: image,
                          index: project.id ?? 0,
                        ),
                      );
                    },
                  ),
                );
              }
            } else if (result is ServerError<ProjectsResponse>) {
              return Center(child: Text("Server Error: ${result.message}"));
            } else if (result is Error<ProjectsResponse>) {
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
