import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/custom_appbar.dart';
import 'widgets/custom_ratio.dart';
import 'widgets/custom_text_form.dart';

class MessageTab extends StatefulWidget {
  MessageTab({super.key});

  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar:CustomAppbar(titleAppbar: "تواصل معنا"),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 45, right: 45, top: 35, bottom: 90),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'مرحبا حسام,بماذا تود ان تخبرنا؟',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                'تواصل معنا',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'لأي اسئله او استفسارات فقط قم بكتابه رساله.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: double.infinity,
                  color: Colors.white24,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 280,
                            width: double.infinity,
                            color: ColorsManager.mainAppColor,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'معلومات التواصل',
                                        style: TextStyle(
                                          color: ColorsManager.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'تستطيع التواصل معنا عبر تلك المعلومات',
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: ColorsManager.white,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        '+1012 3456 789',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: ColorsManager.white,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'hossam@gmail.com',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: ColorsManager.white,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        '132 Dartmouth Street Boston,\n Massachusetts 02156 \n United States',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const CustomTextFormField(hintText: 'الاسم الاول'),
                        const SizedBox(height: 15),
                        const CustomTextFormField(hintText: 'الاسم الاخير'),
                        const SizedBox(height: 15),
                        const CustomTextFormField(hintText: 'الايميل'),
                        const SizedBox(height: 15),
                        const CustomTextFormField(
                            hintText: 'رقم الهاتف',
                            keyboardType: TextInputType.phone),
                        const SizedBox(height: 30),
                        const Text(
                          'اختر موضوع',
                          style: TextStyle(
                              color: ColorsManager.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 10),
                        CustomRadioButton(
                            title: 'General Inquiry',
                            value: 'option1',
                            selectedOption: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            }),
                        CustomRadioButton(
                            title: 'Billing Issue',
                            value: 'option2',
                            selectedOption: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            }),
                        CustomRadioButton(
                            title: 'Technical Support',
                            value: 'option3',
                            selectedOption: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            }),
                        CustomRadioButton(
                            title: 'Other',
                            value: 'option4',
                            selectedOption: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomTextFormField(hintText: 'ادخل الخدمة'),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF171D2B),
                            ),
                            onPressed: () {},
                            child: Text(
                              'ارسال',
                              style: GoogleFonts.alexandria(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: ColorsManager.white),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
