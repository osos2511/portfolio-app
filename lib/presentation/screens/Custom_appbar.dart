import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppbar;

  const CustomAppbar({super.key, required this.titleAppbar});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: AppBar(
        centerTitle: true,
        title: Text(
          titleAppbar,
          style: GoogleFonts.alexandria(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: ColorsManager.mainAppColor, // Ensure text is visible
          ),
        ),
        backgroundColor: ColorsManager.yellow,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
