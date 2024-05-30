import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/signin_data_provider.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/singn_up_provider.dart';
import 'package:smart_cv/provider/data_providers/cover_letter_provider/cover_letter_form_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/certification_data_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/education_data_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/personal_info_data_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/skills_data_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/work_experience.dart';
import 'package:smart_cv/provider/data_providers/error_display_provider/error_provider.dart';
import 'package:smart_cv/provider/data_providers/invitation_card_data_provider/events_detail_data_provider.dart';
import 'package:smart_cv/provider/data_providers/invitation_card_data_provider/host_detail_data_provider.dart';
import 'package:smart_cv/provider/data_providers/invitation_card_data_provider/message_data_provider.dart';
import 'package:smart_cv/provider/data_providers/loder_provider.dart';
import 'package:smart_cv/provider/invitation_card_form_provider.dart';
import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CVFormProvider()),
            ChangeNotifierProvider(
                create: (_) => InvitatioonCardFormProvider()),

            // Data Providers

            // AUTH DATA PROVIDER

            ChangeNotifierProvider(create: (_) => SignInDataProvider()),
            ChangeNotifierProvider(create: (_) => SignUpDataProvider()),
            ChangeNotifierProvider(create: (_) => ErrorProvider()),

            // CV RESUME DETAIL DATAPROVIDER

            ChangeNotifierProvider(
                create: (_) => PersonalInformationProvider()),
            ChangeNotifierProvider(create: (_) => EducationDataProvider()),
            ChangeNotifierProvider(create: (_) => ExperienceDataProvider()),
            ChangeNotifierProvider(create: (_) => SkillDataProvider()),
            ChangeNotifierProvider(create: (_) => CertificationDataProvider()),

            // INVITATION CARD DATA PROVIDERS
            ChangeNotifierProvider(create: (_) => EventDetailsDataProvider()),
            ChangeNotifierProvider(create: (_) => HostDetailsDataProvider()),
            ChangeNotifierProvider(create: (_) => MessageDataProvider()),

            // LOADER PROVIDER
            ChangeNotifierProvider(create: (_) => LoaderProvider()),
            // COVER LETTER PROVIDER
            ChangeNotifierProvider(create: (_) => CoverLetterProvider()),
          ],
          builder: (context, child) {
            return MaterialApp(
              theme: theme,
              title: 'smart_cv',
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.splashScreen,
              routes: AppRoutes.routes,
            );
          },
        );
      },
    );
  }
}
