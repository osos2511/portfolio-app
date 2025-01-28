import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/tabs/discover_tab/discover_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/home/home_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/message/message_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/more/more_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/search/search_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [
    SearchTab(),
    HomeTab(),
    DiscoverTab(),
    MessageTab(),
    MoreTab(),
  ];

  int _pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: _tabs[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: ColorsManager.yellow,
        buttonBackgroundColor: ColorsManager.yellow,
        height: 75,
        index: _pageIndex,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          _buildNavItem(Icons.search, 'Search'),
          _buildNavItem(Icons.home, 'Home'),
          _buildNavItem(Icons.explore, 'Discover'),
          _buildNavItem(Icons.message, 'Message'),
          _buildNavItem(Icons.more_horiz_rounded, 'More'),
        ],
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
          style:  const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainAppColor,
          ),
        ),
      ],
    );
  }
}
