import 'package:flutter/widgets.dart';
import 'package:smart_cv/form/cv_resume/init_cv_resume_form.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

// ignore_for_file: must_be_immutable
class InvitationCardScreen extends StatelessWidget {
  InvitationCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        SizedBox(height: 13.v),
                        Text("Choose A Template ",
                            style: theme.textTheme.headlineSmall),
                        SizedBox(height: 1.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 139.h),
                                child: Text("Invitation Card.",
                                    style: theme.textTheme.headlineSmall))),
                        SizedBox(height: 52.v),
                        SizedBox(height: 157.v),
                        GestureDetector(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgElegantGrandO,
                                height: 429.v,
                                width: 264.h,
                                radius: BorderRadius.circular(20.h)),
                            onTap: () => Navigator.pushNamed(
                                context, AppRoutes.invitationCardCreate)),
                        SizedBox(height: 157.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgClassicNewYea,
                            height: 429.v,
                            width: 264.h,
                            radius: BorderRadius.circular(20.h)),
                        SizedBox(height: 157.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgElegantGrandO,
                            height: 429.v,
                            width: 264.h,
                            radius: BorderRadius.circular(20.h))
                      ]))),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: customAppBar(context, "Invitation Cards"),
                ),
              ],
            )));
  }
}
