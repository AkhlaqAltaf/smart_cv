import 'package:flutter/material.dart';
import 'package:smart_cv/form/cover_letter/cover_letter_form.dart';
import 'package:smart_cv/form/cv_resume/display.dart';
import 'package:smart_cv/form/cv_resume/init_cv_resume_form.dart';
import 'package:smart_cv/form/invitation/display.dart';
import 'package:smart_cv/form/invitation/init_invitation_card_froms.dart';
import 'package:smart_cv/presentation/vistor_screens/cover_letter/cover_letter.dart';
import 'package:smart_cv/presentation/vistor_screens/cv_resume_screen/cv_resume.dart';
import 'package:smart_cv/presentation/vistor_screens/invitation_card/invitation_card.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/cv_educations_screen/cv_educations_screen.dart';
import '../presentation/signin_screen/signin_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/menu_screen/menu_screen.dart';
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

  static const String cvResumeCreate = '/cv_resume_create';
  static const String invitationCardCreate = "/invitation_card_create";
  static const String cvResumeDisplay = "/cvresumePage";

  // VISITING SCREENS
  static const String coverLetter = '/coverLetter';
  static const String invitationCard = '/invitationCard';
  static const String cvResume = '/cvResume';
  static const String coverLetterForm = '/coverLetterForm';

  static const String invitationCardDisplay = '/displatInvitationCard';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signinScreen: (context) => SigninScreen(),
    signupScreen: (context) => SignupScreen(),
    homeScreen: (context) => HomeScreen(),
    menuScreen: (context) => MenuScreen(),
    invitationCardScreen: (context) => InvitationCardScreen(),
    coverLetterScreen: (context) => CoverLetterScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    cvEducationsScreen: (context) => CvEducationsScreen(),
    cvResumeCreate: (context) => InitCVResumeForm(),
    invitationCardCreate: (context) => InitInvitationCardForm(),
    cvResumeDisplay: (context) => CvResumePage(),

    invitationCardDisplay: (context) => InvitationCardDisplay(),
    coverLetterForm: (context) => CoverLetterForm(),

    // VISITING SCREENS
    coverLetter: (context) => CoverLetter(),
    cvResume: (context) => CVResumePage(),
    invitationCard: (context) => InvitationCard(),
  };
}
