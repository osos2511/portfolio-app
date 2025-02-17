import 'package:flutter/material.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';

import '../../../Custom_appbar.dart';
import '../home_tab/widgets/custom_home_container.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"image": AssetsManager.personAvatar, "text": "Hosting"},
      {"image":AssetsManager.personAvatar, "text": "Programming"},
      {"image": AssetsManager.personAvatar, "text": "Software Engineering"},
      {"image": AssetsManager.personAvatar, "text":"Marketing"},
      {"image": AssetsManager.personAvatar, "text":"Interface Designing"},
      {"image": AssetsManager.personAvatar, "text":"Content Production"},
    ];
    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: const CustomAppbar(titleAppbar: 'OUR SERVICES'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 8,left: 8),
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CustomHomeContainer(
              
              image: items[index]["image"]!,
              text: items[index]["text"]!,
            );
          },
        ),
      ),

    );
  }
}
