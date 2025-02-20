import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/presentation/screens/Custom_appbar.dart';
import 'package:provider/provider.dart';
import '../../../../core/colors_manager.dart';
import '../../../../provider/page_controller.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar:  CustomAppbar(titleAppbar: 'معلومات عنا'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white24,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Info Tech',
                    style: GoogleFonts.alexandria(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.right,
                    "نحن فريق من المبتكرين التقنيين الذين يحولون التحديات التكنولوجية إلى فرص استثنائية. كل عضو في فريقنا يتمتع بشغف فريد نحو الابتكار، حيث نجمع بين الخبرة العميقة والإبداع الجريء لصياغة حلول رقمية متميزة. نؤمن أن التكنولوجيا ليست مجرد أكواد، بل هي لغة التغيير والإلهام. نسعى باستمرار لتجاوز الحدود التقليدية، واستكشاف آفاق جديدة في عالم التكنولوجيا. يمثل فريقنا مزيجًا فريدًا من العقول المبتكرة والمتحمسة، حيث نحول الأفكار الجريئة إلى واقع ملموس. نؤمن بقوة التعاون والتفكير خارج الصندوق، ونسعى دائمًا لإحداث تأثير إيجابي من خلال الحلول التكنولوجية المبتكرة التي نقدمها.",
                    style: GoogleFonts.alexandria(
                      color: Colors.white70,
                      fontSize: 15,

                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<PageControllerProvider>().jumpToPage(3);
                    },
                    child: const Text(
                      'تواصل معنا',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
