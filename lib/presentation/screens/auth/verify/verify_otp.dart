import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/core/routes_manager.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171D2B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تأكيد الايميل',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: ColorsManager.yellow),
              ),
              SizedBox(height: 30),
              OtpTextField(
                fieldWidth: 60,
                fieldHeight:75,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),
                numberOfFields: 4,
                focusedBorderColor: ColorsManager.yellow,
                borderColor: ColorsManager.yellow,
                enabledBorderColor: ColorsManager.yellow,
                disabledBorderColor: ColorsManager.yellow,
                showFieldAsBox: true,
                onCodeChanged: (String code) {

                },
                onSubmit: (String verificationCode) {
                  Fluttertoast.showToast(
                      msg: '$verificationCode كود التأكيد: ',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );


                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('لم استلم كود؟ ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                  InkWell(
                      onTap: (){},
                      child: Text('أرسل مجددا',style: TextStyle(
                        color: ColorsManager.yellow,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorsManager.yellow,
                      ),)),
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RoutesManager.confirmPasswordRoute);
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
    );
  }
}

