import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';

class CustomDeveloperContainer extends StatelessWidget {
  final String name;
  final String role;

  const CustomDeveloperContainer({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenWidth * 0.18;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        height: containerHeight,
        color: const Color(0xFF2B3640),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.personAvatar,
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
            ),
            SizedBox(width: screenWidth * 0.04),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  role,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperList extends StatelessWidget {
  const DeveloperList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> developers = [
      {"name": "John Doe", "role": "Flutter Developer"},
      {"name": "Jane Smith", "role": "UI/UX Designer"},
      {"name": "Mike Johnson", "role": "Backend Developer"},
      {"name": "Emily Davis", "role": "Project Manager"},
    ];

    return SizedBox(
      width: screenWidth * 0.9,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: developers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.02,
              horizontal: screenWidth * 0.04,
            ),
            child: CustomDeveloperContainer(
              name: developers[index]["name"]!,
              role: developers[index]["role"]!,
            ),
          );
        },
      ),
    );
  }
}
