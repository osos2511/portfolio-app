import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/assets_manager.dart';

class CustomIconContainer extends StatelessWidget {
  final String logoImage;
  final Color backgroundColor; // Added background color

  const CustomIconContainer({
    super.key,
    required this.logoImage,
    required this.backgroundColor, // Require background color
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.2; // 20% of screen width

    return Container(
      width: size * 0.8,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor, // Set background color
      ),
      child: Center(
        child: Image.asset(
          logoImage,
          width: size * 0.5, // Logo size
          height: size * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class CustomIconList extends StatelessWidget {
  const CustomIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> icons = [
      {"logo": AssetsManager.flutterIcon, "bgColor": ColorsManager.mainAppColor},
      {"logo": AssetsManager.laravelIcon, "bgColor": ColorsManager.mainAppColor},
      {"logo": AssetsManager.reactIcon, "bgColor": ColorsManager.mainAppColor},
      {"logo": AssetsManager.tsIcon, "bgColor": ColorsManager.mainAppColor},
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomIconContainer(
              logoImage: icons[index]["logo"],
              backgroundColor: icons[index]["bgColor"], // Pass background color
            ),
          );
        },
      ),
    );
  }
}
