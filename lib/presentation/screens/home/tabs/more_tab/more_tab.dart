import 'package:flutter/material.dart';
import 'package:info_tech/core/routes_manager.dart';
import 'package:info_tech/presentation/screens/custom_appbar.dart';
import 'package:info_tech/presentation/screens/home/tabs/more_tab/widgets/custom_more_container.dart';
import '../../../../../core/colors_manager.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar:const CustomAppbar(titleAppbar: "المزيد"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.025,vertical: screenHeight *0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.03),
             CustomMoreContainer(text: 'الاعدادات', icon: Icons.settings,onTap: (){

            },),
            SizedBox(height: screenHeight * 0.040),
             CustomMoreContainer(text: 'معلومات عنا', icon: Icons.account_box_outlined,onTap: (){
               Navigator.pushNamed(context, RoutesManager.aboutUsRoute);
      },),
          ],
        ),
      ),
    );
  }
}
