import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/form/cv_resume/header.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/home_screens_provider.dart';
import 'package:smart_cv/provider/invitation_card_form_provider.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
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
            ],
            builder: (context, child) {
              return MaterialApp(
                theme: theme,
                title: 'smart_cv',
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splashScreen,
                routes: AppRoutes.routes,
              );
            });
      },
    );
  }
}
