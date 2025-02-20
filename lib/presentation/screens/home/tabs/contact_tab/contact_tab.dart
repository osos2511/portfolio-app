import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/result.dart';
import '../../../../../data/api_manager/api_manager.dart';
import '../../../../../data/model/contacts/User.dart';
import '../../../../../provider/contactUs.dart';
import 'widgets/custom_text_form.dart';

class ContactUsTab extends StatelessWidget {
  const ContactUsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactUsProvider>(
      create: (_) => ContactUsProvider(),
      child: Consumer<ContactUsProvider>(
        builder: (context, contactUsProvider, child) {
          return Scaffold(
            backgroundColor: ColorsManager.mainAppColor,
            appBar: CustomAppbar(
                titleAppbar: "تواصل معنا"),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Form(
                  key: contactUsProvider.formKey,
                  child: Column(
                    children: [
                      const Text(
                        'لأي أسئلة أو استفسارات فقط قم بكتابة رسالة',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white24,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextFormField(
                                controller:
                                    contactUsProvider.firstNameController,
                                hintText: 'الاسم الأول',
                                validator: (value) =>
                                    value!.isEmpty ? "مطلوب" : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller:
                                    contactUsProvider.lastNameController,
                                hintText: 'الاسم الأخير',
                                validator: (value) =>
                                    value!.isEmpty ? "مطلوب" : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: contactUsProvider.mobileController,
                                hintText: 'رقم الهاتف',
                                keyboardType: TextInputType.phone,
                                validator: (value) =>
                                    value!.isEmpty ? "مطلوب" : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: contactUsProvider.addressController,
                                hintText: 'العنوان',
                                validator: (value) =>
                                    value!.isEmpty ? "مطلوب" : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: contactUsProvider.emailController,
                                hintText: 'الإيميل',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) return "مطلوب";
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                      .hasMatch(value)) {
                                    return "البريد غير صحيح";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: contactUsProvider.titleController,
                                hintText: 'عنوان الرسالة',
                                validator: (value) =>
                                    value!.isEmpty ? "مطلوب" : null,
                              ),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                controller: contactUsProvider.messageController,
                                hintText: 'نص الرسالة',
                                keyboardType: TextInputType.multiline,
                                validator: (value) =>
                                    value!.isEmpty ? "مطلوب" : null,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF171D2B),
                                ),
                                onPressed: () async {
                                  if (contactUsProvider.validateForm()) {
                                    final userData = User(
                                      firstname: contactUsProvider
                                          .firstNameController.text,
                                      lastname: contactUsProvider
                                          .lastNameController.text,
                                      mobile: contactUsProvider
                                          .mobileController.text,
                                      address: contactUsProvider
                                          .addressController.text,
                                      email: contactUsProvider
                                          .emailController.text,
                                      title: contactUsProvider
                                          .titleController.text,
                                      message: contactUsProvider
                                          .messageController.text,
                                    );

                                    var result = await ApiManager.sendContactUs(
                                        userData);
                                    if (result is Success) {
                                      // مسح البيانات من الحقول
                                      contactUsProvider.firstNameController
                                          .clear();
                                      contactUsProvider.lastNameController
                                          .clear();
                                      contactUsProvider.mobileController
                                          .clear();
                                      contactUsProvider.addressController
                                          .clear();
                                      contactUsProvider.emailController.clear();
                                      contactUsProvider.titleController.clear();
                                      contactUsProvider.messageController
                                          .clear();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text("تم الإرسال بنجاح")),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text("حدث خطأ")),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'إرسال',
                                  style: GoogleFonts.alexandria(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
