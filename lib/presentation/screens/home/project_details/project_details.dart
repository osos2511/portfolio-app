import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';

import '../../Custom_appbar.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: CustomAppbar(titleAppbar: 'PROJECT DETAILS'),
      body: Column(),
    );
  }
}
