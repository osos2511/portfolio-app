import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/presentation/screens/custom_appbar.dart';
import 'package:info_tech/presentation/screens/home/tabs/projects_tab/custom_project.dart';
import '../../../../../core/colors_manager.dart';
class ProjectsTab extends StatelessWidget {
  const ProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(titleAppbar: 'OUR PROJECTS'),
      backgroundColor: ColorsManager.mainAppColor,
      body: ListView.builder(
          itemCount: 10,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
          return const CustomProject(title: "solar panelts system planets web", description: "lorem ipsum dolor sit amet orm ipsuma dolor amet sitorem ipsum lorem ipsum dolor sit amet orm ipsuma dolor", image: AssetsManager.aboutUsImg);

          },
          ));
  }
}
