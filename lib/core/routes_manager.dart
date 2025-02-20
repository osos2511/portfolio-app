import 'package:flutter/material.dart';
import 'package:info_tech/presentation/screens/home/about_us/about_us.dart';
import 'package:info_tech/presentation/screens/home/project_details/project_details.dart';
import 'package:info_tech/presentation/screens/home/tabs/contact_tab/contact_tab.dart';
import 'package:info_tech/presentation/screens/home/tabs/more_tab/more_tab.dart';
import 'package:info_tech/presentation/screens/onboarding/onboarding.dart';
import '../presentation/screens/home/home.dart';
import '../presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String homeRoute = '/home';
  static const String splashRoute = '/';
  static const String categoryDetailsName = "/categoryDetails";
  static const String onboardingRoute = "/onboarding";
  static const String moreTabRoute = "/more";
  static const String aboutUsRoute = "/aboutUs";
  static const String projectDetailsRoute = "/projectDetails";
  static const String messageTabRoute = "/messageTab";

  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        {
          return MaterialPageRoute(builder: (context) => const Splash());
        }
      case onboardingRoute:
        {
          return MaterialPageRoute(builder: (context) => const Onboarding());
        }
      case homeRoute:
        {
          return MaterialPageRoute(
              settings: settings,
              builder: (context) => Home());
        }
      case moreTabRoute:
        {
          return MaterialPageRoute(builder: (context) => const MoreTab());
        }
      case messageTabRoute:
        {
          return MaterialPageRoute(builder: (context) =>  const ContactUsTab());
        }

      case aboutUsRoute:
        {
          return MaterialPageRoute(builder: (context) => const AboutUs());
        }
        case projectDetailsRoute:
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const ProjectDetails(),
          );
        }
    }
  }
}
