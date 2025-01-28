import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/presentation/screens/auth/widgets/text_form_field.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/strings_manager.dart';
import '../../../utils/dialog_utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        child: Container(
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
                    StringsManager.signIn,
                    style: GoogleFonts.acme(
                      fontSize: responsiveFontSize(context, 35),
                      color: ColorsManager.yellow,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  TextFormFieldWidget(
                    hintText: StringsManager.hintTextEmail,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Please, enter your E-mail';
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                  TextFormFieldWidget(
                    hintText: StringsManager.hintTextPassword,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'Please, enter your password';
                      }
                      if (input.length < 8) {
                        return 'Your password should be at least 8 characters';
                      }
                      return null;
                    },
                    controller: passwordController,
                    isSecure: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.verifyRoute);
                      },
                      child: Text('Forget Password?',
                          style: TextStyle(
                              color: ColorsManager.yellow,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('All inputs are valid');
                        DialogUtils.showLoadingDialog(context,
                            message: 'Loading...');
                        DialogUtils.hideDialog(context);
                        DialogUtils.messagingDialog(
                          context,
                          content: 'Logged-In Successfully',
                          posActionTitle: 'Ok',
                          posAction: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesManager.onboardingRoute);
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.yellow,
                      minimumSize: Size(screenWidth * 0.5, screenHeight * 0.07),
                    ),
                    child: Text(
                      StringsManager.signIn,
                      style: TextStyle(
                        color: ColorsManager.textButtonColor,
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
                        StringsManager.dontHaveAccount,
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontWeight: FontWeight.w600,
                          fontSize: responsiveFontSize(context, 15),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.registerRoute);
                        },
                        child: Text(
                          StringsManager.signUp,
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