import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_search_view.dart';
import 'package:smart_cv/widgets/custom_icon_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CoverLetterScreen extends StatelessWidget {
  CoverLetterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           
            resizeToAvoidBottomInset: false,
            body:Stack(
              
              children: [
                Padding(padding: EdgeInsets.only(top: 50),
                child: 
                    SizedBox(
             width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 13.v),
                  Text("Choose your cover  ",
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 1.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 139.h),
                          child: Text("letter.",
                              style: theme.textTheme.headlineSmall))),
                  SizedBox(height: 52.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgJovana1,
                      height: 429.v,
                      width: 264.h,
                      radius: BorderRadius.circular(20.h)),
                  SizedBox(height: 157.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgCurrentProfess,
                      height: 429.v,
                      width: 264.h,
                      radius: BorderRadius.circular(20.h)),
                  SizedBox(height: 157.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgCoverLetterTemplates,
                      height: 429.v,
                      width: 264.h,
                      radius: BorderRadius.circular(20.h)),
                  SizedBox(height: 157.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgModernGraphic,
                      height: 429.v,
                      width: 264.h,
                      radius: BorderRadius.circular(20.h))
                ]
                )
                )
                )
                ,),
             
          
       Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: 
                      customAppBar(context,"Cover Letters"),
                ),

              ],
              
            )
      
                )
                );
  }

}