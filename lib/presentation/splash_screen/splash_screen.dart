import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

void checkUser(){
 Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, AppRoutes.signinScreen);
      });
}
  @override
  void initState() {
    checkUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray100,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 42.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              SizedBox(
                height: 276.adaptSize,
                width: 276.adaptSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 239.adaptSize,
                        width: 239.adaptSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            119.h,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment(0.21, 0.12),
                            end: Alignment(0.88, 0.84),
                            colors: [
                              appTheme.cyanA200,
                              appTheme.blueGray60068,
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgJ8p3lf1hro2qmkk,
                      height: 276.adaptSize,
                      width: 276.adaptSize,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
