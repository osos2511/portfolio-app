import 'package:flutter/material.dart';

import '../../../../../../core/colors_manager.dart';

class CustomArrowButton extends StatelessWidget {
   CustomArrowButton({super.key,required this.icon});
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(15),
        backgroundColor: ColorsManager.yellow,
        elevation: 5,
      ),
      onPressed: () {},
      child:  Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
