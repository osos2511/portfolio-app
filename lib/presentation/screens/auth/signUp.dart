import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/auth/widgets/text_form_field.dart';
import '../../../core/assets_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/strings_manager.dart';
import '../../../utils/dialog_utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  double responsiveFontSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (baseFontSize / 375);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff171D2B),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.12,
                left: screenWidth * 0.03,
                right: screenWidth * 0.03,
              ),
              child: Column(
                children: [
                  Text(
                    StringsManager.signUp,
                    style: GoogleFonts.acme(
                      fontSize: responsiveFontSize(context, 35),
                      color: ColorsManager.yellow,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  TextFormFieldWidget(
                    hintText: StringsManager.hintTextFullName,
                    validator: (input) {
                      String pattern = r'^[a-zA-Z]+$';
                      RegExp regex = RegExp(pattern);
                      if (input == null  ||input.trim().isEmpty) {
                        return 'أدخل اسمك بالكامل';
                      }
                      if (input.length < 6) {
                        return 'الاسم يجب ان لا يقل عن 6 حروف';
                      }
                      if (!regex.hasMatch(input)) {
                        return 'صيغه غير صالحه ,مسموح بادخال الحروف فقط';
                      }
                      return null;
                    },
                    controller: fullNameController,
                  ),
                  TextFormFieldWidget(
                    hintText: StringsManager.hintTextEmail,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'أدخل بريدك الالكتروني';
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  TextFormFieldWidget(
                    hintText: StringsManager.hintTextPassword,
                    validator: (input) {

                      if (input == null || input.trim().isEmpty) {
                        return ' أدخل كلمه المرور';
                      }
                      if (input.length < 8) {
                        return 'كلمه المرور يجب ان لا تقل عن 8 حروف';
                      }
                      return null;
                    },
                    controller: passwordController,
                    isSecure: true,
                  ),
                  TextFormFieldWidget(
                    hintText: StringsManager.hintTextConfirmPassword,
                    validator: (input) {
                      if (input == null  ||input.trim().isEmpty) {
                        return 'من فضلك قم بتأكيد كلمه المرور';
                      }
                      if (input.length < 8) {
                        return 'كلمه المرور يجب ان لا تقل عن 8 حروف';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    isSecure: true,
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('All inputs are valid');
                        DialogUtils.showLoadingDialog(
                          context,
                          message: 'تحميل...',
                        );
                        DialogUtils.hideDialog(context);
                        DialogUtils.messagingDialog(
                          context,
                          content: 'تم انشاء حسابك بنجاح',
                          posActionTitle: 'حسنا',
                          posAction: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesManager.loginRoute);
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.yellow,
                      minimumSize: Size(screenWidth * 0.5, screenHeight * 0.07),
                    ),
                    child: Text(
                      StringsManager.signUp,
                      style: TextStyle(
                        color: ColorsManager.mainAppColor,
                        fontSize: responsiveFontSize(context, 25),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.alreadyHaveAccount,
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontWeight: FontWeight.w600,
                          fontSize: responsiveFontSize(context, 15),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.loginRoute);
                        },
                        child: Text(
                          StringsManager.signIn,
                          style: TextStyle(
                            color: ColorsManager.yellow,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.yellow,
                            fontSize: responsiveFontSize(context, 15),
                          ),
                        ),
                      ),
                    ],
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