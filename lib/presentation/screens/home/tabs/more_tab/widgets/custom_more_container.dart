import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';

class CustomMoreContainer extends StatelessWidget {
 const  CustomMoreContainer({super.key,required this.text,required this.icon,required this.onTap});
 final String text;
 final IconData icon;
 final  void Function() onTap;
   @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: ColorsManager.yellow,
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(icon,size: 55,),
                    Text(text,style: GoogleFonts.alexandria(color: ColorsManager.mainAppColor,fontSize: 30,fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
      ),
    );


  }
}
