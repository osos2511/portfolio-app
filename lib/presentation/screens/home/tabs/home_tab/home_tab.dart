import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/assets_manager.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/tabs/home_tab/widgets/custom_discover_container.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.mainAppColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 45,left: 10,right: 10),
          child: Column(
            spacing: 20,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome!',
                          style: GoogleFonts.poppins(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20)),
                      Text(
                        'Osama Mohamed',
                        style: GoogleFonts.poppins(
                            color: ColorsManager.yellow,
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset(AssetsManager.ob3),
                  ),
                ],
              ),

              const Row(
                children: [
                  CustomDiscoverContainer(
                      image: AssetsManager.ob3, text: 'Designing'),
                  Spacer(),
                  CustomDiscoverContainer(
                      image: AssetsManager.ob2, text: 'Development')
                ],
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorsManager.yellow,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        AssetsManager.ob2,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ALL SERVICES",
                            style: GoogleFonts.pottaOne(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorsManager.mainAppColor,
                            ),
                          ),
                          Text(
                            "50%",
                            style: GoogleFonts.pottaOne(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.mainAppColor,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "- web, app development\n"
                                "- web, app designing\n"
                                "- editing web, app\n"
                                "- software engineering\n"
                                "- social media posting",
                            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity,20),
                              backgroundColor: ColorsManager.mainAppColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Apply',
                                  style: GoogleFonts.poppins(
                                    color: ColorsManager.yellow,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: ColorsManager.yellow,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
