import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../../core/strings_manager.dart';
import '../widgets/text_form_field.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.25,
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
            ),
            child: Column(
              children: [
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
                    if (input == null || input.trim().isEmpty) {
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
                SizedBox(height: screenHeight * 0.09),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.loginRoute);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(140, 50),
                      backgroundColor: ColorsManager.yellow
                  ),
                  child: Text('تأكيد',style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: ColorsManager.mainAppColor,
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
