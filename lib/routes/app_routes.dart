import 'package:flutter/material.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/cv_educations_screen/cv_educations_screen.dart';
import '../presentation/signin_screen/signin_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/menu_screen/menu_screen.dart';
import '../presentation/cv_template_screen/cv_template_screen.dart';
import '../presentation/invitation_card_screen/invitation_card_screen.dart';
import '../presentation/cover_letter_screen/cover_letter_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String cvEducationsScreen = '/cv_educations_screen';

  static const String signinScreen = '/signin_screen';

  static const String signupScreen = '/signup_screen';

  static const String homeScreen = '/home_screen';

  static const String menuScreen = '/menu_screen';

  static const String cvTemplateScreen = '/cv_template_screen';

  static const String invitationCardScreen = '/invitation_card_screen';

  static const String coverLetterScreen = '/cover_letter_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {

    splashScreen: (context) => SplashScreen(),
    signinScreen: (context) => SigninScreen(),
    signupScreen: (context) => SignupScreen(),
    homeScreen: (context) => HomeScreen(),
    menuScreen: (context) => MenuScreen(),
    cvTemplateScreen: (context) => CvTemplateScreen(),
    invitationCardScreen: (context) => InvitationCardScreen(),
    coverLetterScreen: (context) => CoverLetterScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    cvEducationsScreen: (context) => CvEducationsScreen(),

    
  };
}