import 'package:flutter/material.dart';
import 'package:info_tech/presentation/screens/auth/verify/confirm_password.dart';
import 'package:info_tech/presentation/screens/auth/verify/verify_otp.dart';
import 'package:info_tech/presentation/screens/home/tabs/more_tab/more_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/search_tab/search_tab.dart';
import 'package:info_tech/presentation/screens/onboarding/onboarding.dart';
import '../presentation/screens/auth/signIn.dart';
import '../presentation/screens/auth/signUp.dart';
import '../presentation/screens/home/home.dart';
import '../presentation/screens/splash/splash.dart';

class RoutesManager{
  static const String homeRoute='/';
  static const String registerRoute='/register';
  static const String loginRoute='/login';
  static const String splashRoute='/splash';
  static const String categoryDetailsName = "/categoryDetails";
  static const String verifyRoute = "/verify";
  static const String confirmPasswordRoute = "/confirmPassword";
  static const String onboardingRoute = "/onboarding";
  static const String searchTabRoute = "/search";
  static const String moreTabRoute = "/more";


  static Route<dynamic>? router(RouteSettings settings){
    switch(settings.name){
      case splashRoute:{
        return MaterialPageRoute(builder: (context) =>  const Splash());
      }
      case registerRoute:{
        return MaterialPageRoute(builder: (context) =>  const SignUp());
      }
      case loginRoute:{
        return MaterialPageRoute(builder: (context) =>  const SignIn());
      }
      case verifyRoute:{
        return MaterialPageRoute(builder: (context) =>  const VerifyOtp());
      }
      case confirmPasswordRoute:{
        return MaterialPageRoute(builder: (context) =>  const ConfirmPassword());
      }
      case onboardingRoute:{
        return MaterialPageRoute(builder: (context) =>  const Onboarding());
      }
      case homeRoute:{
        return MaterialPageRoute(
            settings: settings,
            fullscreenDialog: true,
            builder: (context) =>  const Home());
      }
      case searchTabRoute:{
        return MaterialPageRoute(builder: (context) =>  const SearchTab());
      }
      case moreTabRoute:{
        return MaterialPageRoute(builder: (context) =>   MoreTab());
      }


    }

  }
}