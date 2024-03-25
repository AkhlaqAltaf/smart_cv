import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';
import 'widgets/cvResumeTemplate.dart';
import 'widgets/coverLetterTemplate.dart';
import 'widgets/invitationCardTemplate.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Automatically slide after 500ms
    Timer.periodic(Duration(milliseconds: 2000), (timer) {
      if (_currentPageIndex < 2) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 2000),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: drawer(context),
            resizeToAvoidBottomInset: false,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  customAppBar(context, "Smart CV Builder"),
                  SizedBox(height: 24.v),
                  // Slider
                  SizedBox(
                      height: 119.v,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return CustomImageView(
                              imagePath: _getImagePath(index),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.6,
                            );
                          },
                        ),
                      )),

                  SizedBox(height: 22.v),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.cvTemplateScreen),
                              child: Text("CV/resume Templates.",
                                  style: CustomTextStyles.bodyLarge17)),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: cvResumeTemplate(context),
                        ),
                        SizedBox(height: 30.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.invitationCardScreen),
                              child: Text("Invitation Card Templates.",
                                  style: CustomTextStyles.bodyLarge17)),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: invitationCardTemplate(context),
                        ),
                        SizedBox(height: 30.v),
                        Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.coverLetterScreen),
                              child: Text("Cover Letter Templates.",
                                  style: CustomTextStyles.bodyLarge17)),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: coverLetterTemplate(context),
                        ),
                      ]),
                  SizedBox(height: 30.v)
                ])));
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return ImageConstant.imgSlider1;
      case 1:
        return ImageConstant.imgDownload1;
      case 2:
        return ImageConstant.imgSlider1;
      default:
        return ImageConstant.imgSlider1;
    }
  }
}

/// Section Widget
Widget cvResumeTemplate(BuildContext context) {
  return SizedBox(
      height: 77.v,
      child: ListView.separated(
          padding: EdgeInsets.only(left: 15.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 27.h);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return CvResumeTemplate();
          }));
}

/// Section Widget
Widget invitationCardTemplate(BuildContext context) {
  return SizedBox(
      height: 77.v,
      child: ListView.separated(
          padding: EdgeInsets.only(left: 15.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 27.h);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return InvitationCardTemplate();
          }));
}

/// Section Widget
Widget coverLetterTemplate(BuildContext context) {
  return SizedBox(
      height: 77.v,
      child: ListView.separated(
          padding: EdgeInsets.only(left: 15.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 27.h);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return CoverLetterTemplate();
          }));
}
