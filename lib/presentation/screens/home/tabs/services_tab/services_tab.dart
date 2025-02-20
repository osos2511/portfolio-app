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
      {"image": AssetsManager.personAvatar, "text": "الاستضافه"},
      {"image":AssetsManager.personAvatar, "text": "البرمجه"},
      {"image": AssetsManager.personAvatar, "text": "هندسه البرمجيات"},
      {"image": AssetsManager.personAvatar, "text":"التسويق"},
      {"image": AssetsManager.personAvatar, "text":"تصميم الواجهات"},
      {"image": AssetsManager.personAvatar, "text":"صنع المحتوي"},
    ];
    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar:  const CustomAppbar(titleAppbar: 'خدماتنا'),
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
