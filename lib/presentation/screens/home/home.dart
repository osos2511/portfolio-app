import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/tabs/discover/discover.dart';
import 'package:info_tech/presentation/screens/home/tabs/home/home.dart';
import 'package:info_tech/presentation/screens/home/tabs/message/message.dart';
import 'package:info_tech/presentation/screens/home/tabs/more/more.dart';
import 'package:info_tech/presentation/screens/home/tabs/search/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [
    Discover(),
    Search(),
    Message(),
    More(),
    Home(), // Ensure this is not recursive
  ];

  int _pageIndex = 4; // Default to the Home tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsManager.textButtonColor,
      body: _tabs[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).primaryColorDark,
        height: 70,
        index: _pageIndex,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          _buildNavItem(Icons.explore, 'Discover'),
          _buildNavItem(Icons.search, 'Search'),
          _buildNavItem(Icons.message, 'Message'),
          _buildNavItem(Icons.more_horiz, 'More'),
          _buildNavItem(Icons.home, 'Home'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
