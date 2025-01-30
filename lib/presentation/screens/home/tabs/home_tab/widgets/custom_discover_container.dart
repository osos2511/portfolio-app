import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';

class CustomDiscoverContainer extends StatelessWidget {
   const CustomDiscoverContainer({super.key,required this.image,required this.text});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.43,
      height: MediaQuery.of(context).size.height*0.30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration:  BoxDecoration(
        color: ColorsManager.yellow,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text,style: GoogleFonts.pottaOne(color: ColorsManager.mainAppColor,fontWeight: FontWeight.w400,fontSize: 20),),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image)),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.mainAppColor),
              child: Row(
            children: [
              Text('Discover',style: GoogleFonts.poppins(color: Colors.yellow,fontWeight: FontWeight.w400,fontSize: 15),),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right_rounded,color: ColorsManager.yellow,size: 20,),
            ],
          ))


        ],
      ),
    );
  }
}
