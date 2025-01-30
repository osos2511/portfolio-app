import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/tabs/home_tab/home_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/message_tab/message_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/more_tab/more_tab.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:info_tech/presentation/screens/home/tabs/projects_tab/projects_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/services_tab/services_tab.dart';
import 'package:provider/provider.dart';
import '../../../provider/page_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> _tabs = [
    const ServicesTab(),
    const ProjectsTab(),
    const HomeTab(),
     MessageTab(),
    const MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Consumer<PageControllerProvider>(
        builder: (context, pageControllerProvider, child) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageControllerProvider.pageController,
            onPageChanged: (index) {

            },
            children: _tabs,
          );
        },
      ),
      bottomNavigationBar: Consumer<PageControllerProvider>(
        builder: (context, pageControllerProvider, child) {
          return CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: ColorsManager.yellow,
            buttonBackgroundColor: ColorsManager.yellow,
            height: 75,
            index: pageControllerProvider.currentIndex,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              context.read<PageControllerProvider>().jumpToPage(index);
            },
            items: [
              _buildNavItem(Icons.build, 'Services'),
              _buildNavItem(Icons.folder_special, 'Projects'),
              _buildNavItem(Icons.home, 'Home'),
              _buildNavItem(Icons.message, 'Message'),
              _buildNavItem(Icons.more_horiz_rounded, 'More'),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: ColorsManager.mainAppColor),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainAppColor,
          ),
        ),
      ],
    );
  }
}
